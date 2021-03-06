#!perl

use strict;
use warnings;

BEGIN { delete $ENV{PERL_INDIRECT_PM_DISABLE} }

my ($module, $thread_safe_var);
BEGIN {
 $module          = 'indirect';
 $thread_safe_var = 'indirect::I_THREADSAFE()';
}

sub load_test {
 my $res;
 if (defined &indirect::msg) {
  local $@;
  eval 'BEGIN { indirect->unimport(":fatal") if defined &indirect::msg } return; my $x = new X;';
  $res = $@;
 }
 if (defined $res and $res =~ /^Indirect call of method/) {
  return 1;
 } elsif (not defined $res or $res eq '') {
  return 0;
 } else {
  return $res;
 }
}

# Keep the rest of the file untouched

use lib 't/lib';
use VPIT::TestHelpers threads => [ $module, $thread_safe_var ];

my $could_not_create_thread = 'Could not create thread';

use Test::Leaner tests => 1 + (2 + 2 * 2) + 6 + (2 * 4 + 1) * 2 + 1;

sub is_loaded {
 my ($affirmative, $desc) = @_;

 my $res = load_test();

 my $expected;
 if ($affirmative) {
  $expected = 1;
  $desc     = "$desc: module loaded";
 } else {
  $expected = 0;
  $desc     = "$desc: module not loaded";
 }

 unless (is $res, $expected, $desc) {
  $res      = defined $res ? "'$res'" : 'undef';
  $expected = "'$expected'";
  diag("Test '$desc' failed: got $res, expected $expected");
 }

 return;
}

BEGIN {
 local $@;
 my $code = eval "sub { require $module }";
 die $@ if $@;
 *do_load = $code;
}

is_loaded 0, 'main body, beginning';

# Test serial loadings

SKIP: {
 my $thr = spawn(sub {
  my $here = "first serial thread";
  is_loaded 0, "$here, beginning";

  do_load;
  is_loaded 1, "$here, after loading";

  return;
 });

 skip "$could_not_create_thread (serial 1)" => 2 unless defined $thr;

 $thr->join;
 if (my $err = $thr->error) {
  die $err;
 }
}

is_loaded 0, 'main body, in between serial loadings';

SKIP: {
 my $thr = spawn(sub {
  my $here = "second serial thread";
  is_loaded 0, "$here, beginning";

  do_load;
  is_loaded 1, "$here, after loading";

  return;
 });

 skip "$could_not_create_thread (serial 2)" => 2 unless defined $thr;

 $thr->join;
 if (my $err = $thr->error) {
  die $err;
 }
}

is_loaded 0, 'main body, after serial loadings';

# Test nested loadings

SKIP: {
 my $thr = spawn(sub {
  my $here = 'parent thread';
  is_loaded 0, "$here, beginning";

  SKIP: {
   my $kid = spawn(sub {
    my $here = 'child thread';
    is_loaded 0, "$here, beginning";

    do_load;
    is_loaded 1, "$here, after loading";

    return;
   });

   skip "$could_not_create_thread (nested child)" => 2 unless defined $kid;

   $kid->join;
   if (my $err = $kid->error) {
    die "in child thread: $err\n";
   }
  }

  is_loaded 0, "$here, after child terminated";

  do_load;
  is_loaded 1, "$here, after loading";

  return;
 });

 skip "$could_not_create_thread (nested parent)" => (3 + 2) unless defined $thr;

 $thr->join;
 if (my $err = $thr->error) {
  die $err;
 }
}

is_loaded 0, 'main body, after nested loadings';

# Test parallel loadings

use threads;
use threads::shared;

my $sync_points = 7;

my @locks_down = (1) x $sync_points;
my @locks_up   = (0) x $sync_points;
share($_) for @locks_down, @locks_up;

my $default_peers = 2;

sub sync_master {
 my ($id, $peers) = @_;

 $peers = $default_peers unless defined $peers;

 {
  lock $locks_down[$id];
  $locks_down[$id] = 0;
  cond_broadcast $locks_down[$id];
 }

 {
  lock $locks_up[$id];
  cond_wait $locks_up[$id] until $locks_up[$id] == $peers;
 }
}

sub sync_slave {
 my ($id) = @_;

 {
  lock $locks_down[$id];
  cond_wait $locks_down[$id] until $locks_down[$id] == 0;
 }

 {
  lock $locks_up[$id];
  $locks_up[$id]++;
  cond_signal $locks_up[$id];
 }
}

for my $first_thread_ends_first (0, 1) {
 for my $id (0 .. $sync_points - 1) {
  {
   lock $locks_down[$id];
   $locks_down[$id] = 1;
  }
  {
   lock $locks_up[$id];
   $locks_up[$id] = 0;
  }
 }

 my $thr1_end = 'finishes first';
 my $thr2_end = 'finishes last';

 ($thr1_end, $thr2_end) = ($thr2_end, $thr1_end)
                                                unless $first_thread_ends_first;

 SKIP: {
  my $thr1 = spawn(sub {
   my $here = "first simultaneous thread ($thr1_end)";
   sync_slave 0;

   is_loaded 0, "$here, beginning";
   sync_slave 1;

   do_load;
   is_loaded 1, "$here, after loading";
   sync_slave 2;
   sync_slave 3;

   sync_slave 4;
   is_loaded 1, "$here, still loaded while also loaded in the other thread";
   sync_slave 5;

   sync_slave 6 unless $first_thread_ends_first;

   is_loaded 1, "$here, end";

   return;
  });

  skip "$could_not_create_thread (parallel 1)" => (4 * 2) unless defined $thr1;

  my $thr2 = spawn(sub {
   my $here = "second simultaneous thread ($thr2_end)";
   sync_slave 0;

   is_loaded 0, "$here, beginning";
   sync_slave 1;

   sync_slave 2;
   sync_slave 3;
   is_loaded 0, "$here, loaded in other thread but not here";

   do_load;
   is_loaded 1, "$here, after loading";
   sync_slave 4;
   sync_slave 5;

   sync_slave 6 if $first_thread_ends_first;

   is_loaded 1, "$here, end";

   return;
  });

  sync_master($_) for 0 .. 5;

  if (defined $thr2) {
   ($thr2, $thr1) = ($thr1, $thr2) unless $first_thread_ends_first;

   $thr1->join;
   if (my $err = $thr1->error) {
    die $err;
   }

   sync_master(6, 1);

   $thr2->join;
   if (my $err = $thr1->error) {
    die $err;
   }
  } else {
   sync_master(6, 1) unless $first_thread_ends_first;

   $thr1->join;
   if (my $err = $thr1->error) {
    die $err;
   }

   skip "$could_not_create_thread (parallel 2)" => (4 * 1);
  }
 }

 is_loaded 0, 'main body, after simultaneous threads';
}

do_load;
is_loaded 1, 'main body, loaded at end';
