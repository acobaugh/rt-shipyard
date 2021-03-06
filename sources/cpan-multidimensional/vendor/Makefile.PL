# This Makefile.PL for  was generated by Dist::Zilla.
# Don't edit it but the dist.ini used to construct it.
BEGIN { require 5.008; }
use strict;
use warnings;
use ExtUtils::MakeMaker 6.30;

my %WriteMakefileArgs = (
  'ABSTRACT' => 'disables multidimensional array emulation',
  'AUTHOR' => 'Dagfinn Ilmari Mannsåker <ilmari@ilmari.org>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0.88'
  },
  'CONFIGURE_REQUIRES' => {
    'B::Hooks::OP::Check' => '0',
    'CPAN::Meta' => '2.112580',
    'ExtUtils::Depends' => '0',
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'multidimensional',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'multidimensional',
  'PREREQ_PM' => {
    'B::Hooks::OP::Check' => '0.19',
    'Lexical::SealRequireHints' => '0.005',
    'XSLoader' => '0',
    'strict' => '0',
    'warnings' => '0'
  },
  'VERSION' => '0.011',
  'test' => {
    'TESTS' => 't/*.t'
  },
  do{ require ExtUtils::Depends; ExtUtils::Depends->new('multidimensional', 'B::Hooks::OP::Check')->get_makefile_vars }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);

