# This file is auto-generated by the Perl DateTime Suite time zone
# code generator (0.07) This code generator comes with the
# DateTime::TimeZone module distribution in the tools/ directory

#
# Generated from /tmp/Q713JNUf8G/africa.  Olson data version 2016a
#
# Do not edit this file directly.
#
package DateTime::TimeZone::Africa::Lagos;
$DateTime::TimeZone::Africa::Lagos::VERSION = '1.95';
use strict;

use Class::Singleton 1.03;
use DateTime::TimeZone;
use DateTime::TimeZone::OlsonDB;

@DateTime::TimeZone::Africa::Lagos::ISA = ( 'Class::Singleton', 'DateTime::TimeZone' );

my $spans =
[
    [
DateTime::TimeZone::NEG_INFINITY, #    utc_start
60547218384, #      utc_end 1919-08-31 23:46:24 (Sun)
DateTime::TimeZone::NEG_INFINITY, #  local_start
60547219200, #    local_end 1919-09-01 00:00:00 (Mon)
816,
0,
'LMT',
    ],
    [
60547218384, #    utc_start 1919-08-31 23:46:24 (Sun)
DateTime::TimeZone::INFINITY, #      utc_end
60547221984, #  local_start 1919-09-01 00:46:24 (Mon)
DateTime::TimeZone::INFINITY, #    local_end
3600,
0,
'WAT',
    ],
];

sub olson_version {'2016a'}

sub has_dst_changes {0}

sub _max_year {2026}

sub _new_instance {
    return shift->_init( @_, spans => $spans );
}



1;

