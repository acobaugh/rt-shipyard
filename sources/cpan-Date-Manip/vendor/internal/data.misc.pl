#!/usr/bin/perl -w
# Copyright (c) 2008-2016 Sullivan Beck.  All rights reserved.
# This program is free software; you can redistribute it and/or modify it
# under the same terms as Perl itself.

# We will store all critical dates for all past years, and years
# up to some point in the future. Critical dates past that year
# will be calculated on the fly.  $keep_years is the number of
# years in the future which will be kept explicitly.
#
# This ensures that years in the near future can be accessed quickly,
# and that all years past a threshold are assumed to be static
# (with respect to how critical dates are calculated).
#
# This is the number of years in the future to keep. For testing
# purposes, we'll compare years beyond that to make sure that the
# critical dates are constant. This value ($test_years) must be
# greater than $keep_years.

my($keep_years,$test_years);
$keep_years = 50;
$test_years = 60;

$curr_year  = (localtime)[5] + 1900;
$keep_year  = $curr_year + $keep_years;
$test_year  = $curr_year + $test_years;

# Autogenerated module information

$zones_pm   = "lib/Date/Manip/Zones.pm";
$zones_pod  = $zones_pm;
$zones_pod  =~ s/\.pm/.pod/;
$mod_dir    = "lib/Date/Manip/TZ";
$off_dir    = "lib/Date/Manip/Offset";

# Most zones have a LAST RULE that includes exactly 1 ST (i.e. an offset
# of 00:00) and 1 DST (some other offset).
#
# The following zones are exceptions:

%last_zone_offsets =
  (
#  "America/Resolute" => { "dst" => 0,
#                          "st"  => 2, },
  );

# The following zone(s) will not use a LAST RULE to calculate time zone
# changes past $keep_year. Instead, they will use all dates from a dump,
# and nothing beyond that.
#
# Asia/Jerusalem uses a non-standard way based on the Hebrew calendar.

%no_last = map { $_,1 } qw(Asia/Jerusalem Asia/Tehran);

1;

# Local Variables:
# mode: cperl
# indent-tabs-mode: nil
# cperl-indent-level: 3
# cperl-continued-statement-offset: 2
# cperl-continued-brace-offset: 0
# cperl-brace-offset: 0
# cperl-brace-imaginary-offset: 0
# cperl-label-offset: 0
# End:
