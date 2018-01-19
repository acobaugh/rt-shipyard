package #
Date::Manip::TZ::eumins00;
# Copyright (c) 2008-2016 Sullivan Beck.  All rights reserved.
# This program is free software; you can redistribute it and/or modify it
# under the same terms as Perl itself.

# This file was automatically generated.  Any changes to this file will
# be lost the next time 'tzdata' is run.
#    Generated on: Wed Mar  2 10:46:10 EST 2016
#    Data version: tzdata2016a
#    Code version: tzcode2016a

# This module contains data from the zoneinfo time zone database.  The original
# data was obtained from the URL:
#    ftp://ftp.iana.org/tz

use strict;
use warnings;
require 5.010000;

our (%Dates,%LastRule);
END {
   undef %Dates;
   undef %LastRule;
}

our ($VERSION);
$VERSION='6.53';
END { undef $VERSION; }

%Dates         = (
   1    =>
     [
        [ [1,1,2,0,0,0],[1,1,2,1,50,16],'+01:50:16',[1,50,16],
          'LMT',0,[1879,12,31,22,9,43],[1879,12,31,23,59,59],
          '0001010200:00:00','0001010201:50:16','1879123122:09:43','1879123123:59:59' ],
     ],
   1879 =>
     [
        [ [1879,12,31,22,9,44],[1879,12,31,23,59,44],'+01:50:00',[1,50,0],
          'MMT',0,[1924,5,1,22,9,59],[1924,5,1,23,59,59],
          '1879123122:09:44','1879123123:59:44','1924050122:09:59','1924050123:59:59' ],
     ],
   1924 =>
     [
        [ [1924,5,1,22,10,0],[1924,5,2,0,10,0],'+02:00:00',[2,0,0],
          'EET',0,[1930,6,20,21,59,59],[1930,6,20,23,59,59],
          '1924050122:10:00','1924050200:10:00','1930062021:59:59','1930062023:59:59' ],
     ],
   1930 =>
     [
        [ [1930,6,20,22,0,0],[1930,6,21,1,0,0],'+03:00:00',[3,0,0],
          'MSK',0,[1941,6,27,20,59,59],[1941,6,27,23,59,59],
          '1930062022:00:00','1930062101:00:00','1941062720:59:59','1941062723:59:59' ],
     ],
   1941 =>
     [
        [ [1941,6,27,21,0,0],[1941,6,27,23,0,0],'+02:00:00',[2,0,0],
          'CEST',1,[1942,11,2,0,59,59],[1942,11,2,2,59,59],
          '1941062721:00:00','1941062723:00:00','1942110200:59:59','1942110202:59:59' ],
     ],
   1942 =>
     [
        [ [1942,11,2,1,0,0],[1942,11,2,2,0,0],'+01:00:00',[1,0,0],
          'CET',0,[1943,3,29,0,59,59],[1943,3,29,1,59,59],
          '1942110201:00:00','1942110202:00:00','1943032900:59:59','1943032901:59:59' ],
     ],
   1943 =>
     [
        [ [1943,3,29,1,0,0],[1943,3,29,3,0,0],'+02:00:00',[2,0,0],
          'CEST',1,[1943,10,4,0,59,59],[1943,10,4,2,59,59],
          '1943032901:00:00','1943032903:00:00','1943100400:59:59','1943100402:59:59' ],
        [ [1943,10,4,1,0,0],[1943,10,4,2,0,0],'+01:00:00',[1,0,0],
          'CET',0,[1944,4,3,0,59,59],[1944,4,3,1,59,59],
          '1943100401:00:00','1943100402:00:00','1944040300:59:59','1944040301:59:59' ],
     ],
   1944 =>
     [
        [ [1944,4,3,1,0,0],[1944,4,3,3,0,0],'+02:00:00',[2,0,0],
          'CEST',1,[1944,7,2,21,59,59],[1944,7,2,23,59,59],
          '1944040301:00:00','1944040303:00:00','1944070221:59:59','1944070223:59:59' ],
        [ [1944,7,2,22,0,0],[1944,7,3,1,0,0],'+03:00:00',[3,0,0],
          'MSK',0,[1981,3,31,20,59,59],[1981,3,31,23,59,59],
          '1944070222:00:00','1944070301:00:00','1981033120:59:59','1981033123:59:59' ],
     ],
   1981 =>
     [
        [ [1981,3,31,21,0,0],[1981,4,1,1,0,0],'+04:00:00',[4,0,0],
          'MSD',1,[1981,9,30,19,59,59],[1981,9,30,23,59,59],
          '1981033121:00:00','1981040101:00:00','1981093019:59:59','1981093023:59:59' ],
        [ [1981,9,30,20,0,0],[1981,9,30,23,0,0],'+03:00:00',[3,0,0],
          'MSK',0,[1982,3,31,20,59,59],[1982,3,31,23,59,59],
          '1981093020:00:00','1981093023:00:00','1982033120:59:59','1982033123:59:59' ],
     ],
   1982 =>
     [
        [ [1982,3,31,21,0,0],[1982,4,1,1,0,0],'+04:00:00',[4,0,0],
          'MSD',1,[1982,9,30,19,59,59],[1982,9,30,23,59,59],
          '1982033121:00:00','1982040101:00:00','1982093019:59:59','1982093023:59:59' ],
        [ [1982,9,30,20,0,0],[1982,9,30,23,0,0],'+03:00:00',[3,0,0],
          'MSK',0,[1983,3,31,20,59,59],[1983,3,31,23,59,59],
          '1982093020:00:00','1982093023:00:00','1983033120:59:59','1983033123:59:59' ],
     ],
   1983 =>
     [
        [ [1983,3,31,21,0,0],[1983,4,1,1,0,0],'+04:00:00',[4,0,0],
          'MSD',1,[1983,9,30,19,59,59],[1983,9,30,23,59,59],
          '1983033121:00:00','1983040101:00:00','1983093019:59:59','1983093023:59:59' ],
        [ [1983,9,30,20,0,0],[1983,9,30,23,0,0],'+03:00:00',[3,0,0],
          'MSK',0,[1984,3,31,20,59,59],[1984,3,31,23,59,59],
          '1983093020:00:00','1983093023:00:00','1984033120:59:59','1984033123:59:59' ],
     ],
   1984 =>
     [
        [ [1984,3,31,21,0,0],[1984,4,1,1,0,0],'+04:00:00',[4,0,0],
          'MSD',1,[1984,9,29,22,59,59],[1984,9,30,2,59,59],
          '1984033121:00:00','1984040101:00:00','1984092922:59:59','1984093002:59:59' ],
        [ [1984,9,29,23,0,0],[1984,9,30,2,0,0],'+03:00:00',[3,0,0],
          'MSK',0,[1985,3,30,22,59,59],[1985,3,31,1,59,59],
          '1984092923:00:00','1984093002:00:00','1985033022:59:59','1985033101:59:59' ],
     ],
   1985 =>
     [
        [ [1985,3,30,23,0,0],[1985,3,31,3,0,0],'+04:00:00',[4,0,0],
          'MSD',1,[1985,9,28,22,59,59],[1985,9,29,2,59,59],
          '1985033023:00:00','1985033103:00:00','1985092822:59:59','1985092902:59:59' ],
        [ [1985,9,28,23,0,0],[1985,9,29,2,0,0],'+03:00:00',[3,0,0],
          'MSK',0,[1986,3,29,22,59,59],[1986,3,30,1,59,59],
          '1985092823:00:00','1985092902:00:00','1986032922:59:59','1986033001:59:59' ],
     ],
   1986 =>
     [
        [ [1986,3,29,23,0,0],[1986,3,30,3,0,0],'+04:00:00',[4,0,0],
          'MSD',1,[1986,9,27,22,59,59],[1986,9,28,2,59,59],
          '1986032923:00:00','1986033003:00:00','1986092722:59:59','1986092802:59:59' ],
        [ [1986,9,27,23,0,0],[1986,9,28,2,0,0],'+03:00:00',[3,0,0],
          'MSK',0,[1987,3,28,22,59,59],[1987,3,29,1,59,59],
          '1986092723:00:00','1986092802:00:00','1987032822:59:59','1987032901:59:59' ],
     ],
   1987 =>
     [
        [ [1987,3,28,23,0,0],[1987,3,29,3,0,0],'+04:00:00',[4,0,0],
          'MSD',1,[1987,9,26,22,59,59],[1987,9,27,2,59,59],
          '1987032823:00:00','1987032903:00:00','1987092622:59:59','1987092702:59:59' ],
        [ [1987,9,26,23,0,0],[1987,9,27,2,0,0],'+03:00:00',[3,0,0],
          'MSK',0,[1988,3,26,22,59,59],[1988,3,27,1,59,59],
          '1987092623:00:00','1987092702:00:00','1988032622:59:59','1988032701:59:59' ],
     ],
   1988 =>
     [
        [ [1988,3,26,23,0,0],[1988,3,27,3,0,0],'+04:00:00',[4,0,0],
          'MSD',1,[1988,9,24,22,59,59],[1988,9,25,2,59,59],
          '1988032623:00:00','1988032703:00:00','1988092422:59:59','1988092502:59:59' ],
        [ [1988,9,24,23,0,0],[1988,9,25,2,0,0],'+03:00:00',[3,0,0],
          'MSK',0,[1989,3,25,22,59,59],[1989,3,26,1,59,59],
          '1988092423:00:00','1988092502:00:00','1989032522:59:59','1989032601:59:59' ],
     ],
   1989 =>
     [
        [ [1989,3,25,23,0,0],[1989,3,26,3,0,0],'+04:00:00',[4,0,0],
          'MSD',1,[1989,9,23,22,59,59],[1989,9,24,2,59,59],
          '1989032523:00:00','1989032603:00:00','1989092322:59:59','1989092402:59:59' ],
        [ [1989,9,23,23,0,0],[1989,9,24,2,0,0],'+03:00:00',[3,0,0],
          'MSK',0,[1991,3,30,22,59,59],[1991,3,31,1,59,59],
          '1989092323:00:00','1989092402:00:00','1991033022:59:59','1991033101:59:59' ],
     ],
   1991 =>
     [
        [ [1991,3,30,23,0,0],[1991,3,31,2,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[1991,9,28,23,59,59],[1991,9,29,2,59,59],
          '1991033023:00:00','1991033102:00:00','1991092823:59:59','1991092902:59:59' ],
        [ [1991,9,29,0,0,0],[1991,9,29,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[1992,3,28,21,59,59],[1992,3,28,23,59,59],
          '1991092900:00:00','1991092902:00:00','1992032821:59:59','1992032823:59:59' ],
     ],
   1992 =>
     [
        [ [1992,3,28,22,0,0],[1992,3,29,1,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[1992,9,26,21,59,59],[1992,9,27,0,59,59],
          '1992032822:00:00','1992032901:00:00','1992092621:59:59','1992092700:59:59' ],
        [ [1992,9,26,22,0,0],[1992,9,27,0,0,0],'+02:00:00',[2,0,0],
          'EET',0,[1993,3,27,23,59,59],[1993,3,28,1,59,59],
          '1992092622:00:00','1992092700:00:00','1993032723:59:59','1993032801:59:59' ],
     ],
   1993 =>
     [
        [ [1993,3,28,0,0,0],[1993,3,28,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[1993,9,25,23,59,59],[1993,9,26,2,59,59],
          '1993032800:00:00','1993032803:00:00','1993092523:59:59','1993092602:59:59' ],
        [ [1993,9,26,0,0,0],[1993,9,26,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[1994,3,26,23,59,59],[1994,3,27,1,59,59],
          '1993092600:00:00','1993092602:00:00','1994032623:59:59','1994032701:59:59' ],
     ],
   1994 =>
     [
        [ [1994,3,27,0,0,0],[1994,3,27,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[1994,9,24,23,59,59],[1994,9,25,2,59,59],
          '1994032700:00:00','1994032703:00:00','1994092423:59:59','1994092502:59:59' ],
        [ [1994,9,25,0,0,0],[1994,9,25,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[1995,3,25,23,59,59],[1995,3,26,1,59,59],
          '1994092500:00:00','1994092502:00:00','1995032523:59:59','1995032601:59:59' ],
     ],
   1995 =>
     [
        [ [1995,3,26,0,0,0],[1995,3,26,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[1995,9,23,23,59,59],[1995,9,24,2,59,59],
          '1995032600:00:00','1995032603:00:00','1995092323:59:59','1995092402:59:59' ],
        [ [1995,9,24,0,0,0],[1995,9,24,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[1996,3,30,23,59,59],[1996,3,31,1,59,59],
          '1995092400:00:00','1995092402:00:00','1996033023:59:59','1996033101:59:59' ],
     ],
   1996 =>
     [
        [ [1996,3,31,0,0,0],[1996,3,31,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[1996,10,26,23,59,59],[1996,10,27,2,59,59],
          '1996033100:00:00','1996033103:00:00','1996102623:59:59','1996102702:59:59' ],
        [ [1996,10,27,0,0,0],[1996,10,27,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[1997,3,29,23,59,59],[1997,3,30,1,59,59],
          '1996102700:00:00','1996102702:00:00','1997032923:59:59','1997033001:59:59' ],
     ],
   1997 =>
     [
        [ [1997,3,30,0,0,0],[1997,3,30,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[1997,10,25,23,59,59],[1997,10,26,2,59,59],
          '1997033000:00:00','1997033003:00:00','1997102523:59:59','1997102602:59:59' ],
        [ [1997,10,26,0,0,0],[1997,10,26,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[1998,3,28,23,59,59],[1998,3,29,1,59,59],
          '1997102600:00:00','1997102602:00:00','1998032823:59:59','1998032901:59:59' ],
     ],
   1998 =>
     [
        [ [1998,3,29,0,0,0],[1998,3,29,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[1998,10,24,23,59,59],[1998,10,25,2,59,59],
          '1998032900:00:00','1998032903:00:00','1998102423:59:59','1998102502:59:59' ],
        [ [1998,10,25,0,0,0],[1998,10,25,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[1999,3,27,23,59,59],[1999,3,28,1,59,59],
          '1998102500:00:00','1998102502:00:00','1999032723:59:59','1999032801:59:59' ],
     ],
   1999 =>
     [
        [ [1999,3,28,0,0,0],[1999,3,28,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[1999,10,30,23,59,59],[1999,10,31,2,59,59],
          '1999032800:00:00','1999032803:00:00','1999103023:59:59','1999103102:59:59' ],
        [ [1999,10,31,0,0,0],[1999,10,31,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[2000,3,25,23,59,59],[2000,3,26,1,59,59],
          '1999103100:00:00','1999103102:00:00','2000032523:59:59','2000032601:59:59' ],
     ],
   2000 =>
     [
        [ [2000,3,26,0,0,0],[2000,3,26,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[2000,10,28,23,59,59],[2000,10,29,2,59,59],
          '2000032600:00:00','2000032603:00:00','2000102823:59:59','2000102902:59:59' ],
        [ [2000,10,29,0,0,0],[2000,10,29,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[2001,3,24,23,59,59],[2001,3,25,1,59,59],
          '2000102900:00:00','2000102902:00:00','2001032423:59:59','2001032501:59:59' ],
     ],
   2001 =>
     [
        [ [2001,3,25,0,0,0],[2001,3,25,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[2001,10,27,23,59,59],[2001,10,28,2,59,59],
          '2001032500:00:00','2001032503:00:00','2001102723:59:59','2001102802:59:59' ],
        [ [2001,10,28,0,0,0],[2001,10,28,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[2002,3,30,23,59,59],[2002,3,31,1,59,59],
          '2001102800:00:00','2001102802:00:00','2002033023:59:59','2002033101:59:59' ],
     ],
   2002 =>
     [
        [ [2002,3,31,0,0,0],[2002,3,31,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[2002,10,26,23,59,59],[2002,10,27,2,59,59],
          '2002033100:00:00','2002033103:00:00','2002102623:59:59','2002102702:59:59' ],
        [ [2002,10,27,0,0,0],[2002,10,27,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[2003,3,29,23,59,59],[2003,3,30,1,59,59],
          '2002102700:00:00','2002102702:00:00','2003032923:59:59','2003033001:59:59' ],
     ],
   2003 =>
     [
        [ [2003,3,30,0,0,0],[2003,3,30,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[2003,10,25,23,59,59],[2003,10,26,2,59,59],
          '2003033000:00:00','2003033003:00:00','2003102523:59:59','2003102602:59:59' ],
        [ [2003,10,26,0,0,0],[2003,10,26,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[2004,3,27,23,59,59],[2004,3,28,1,59,59],
          '2003102600:00:00','2003102602:00:00','2004032723:59:59','2004032801:59:59' ],
     ],
   2004 =>
     [
        [ [2004,3,28,0,0,0],[2004,3,28,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[2004,10,30,23,59,59],[2004,10,31,2,59,59],
          '2004032800:00:00','2004032803:00:00','2004103023:59:59','2004103102:59:59' ],
        [ [2004,10,31,0,0,0],[2004,10,31,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[2005,3,26,23,59,59],[2005,3,27,1,59,59],
          '2004103100:00:00','2004103102:00:00','2005032623:59:59','2005032701:59:59' ],
     ],
   2005 =>
     [
        [ [2005,3,27,0,0,0],[2005,3,27,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[2005,10,29,23,59,59],[2005,10,30,2,59,59],
          '2005032700:00:00','2005032703:00:00','2005102923:59:59','2005103002:59:59' ],
        [ [2005,10,30,0,0,0],[2005,10,30,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[2006,3,25,23,59,59],[2006,3,26,1,59,59],
          '2005103000:00:00','2005103002:00:00','2006032523:59:59','2006032601:59:59' ],
     ],
   2006 =>
     [
        [ [2006,3,26,0,0,0],[2006,3,26,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[2006,10,28,23,59,59],[2006,10,29,2,59,59],
          '2006032600:00:00','2006032603:00:00','2006102823:59:59','2006102902:59:59' ],
        [ [2006,10,29,0,0,0],[2006,10,29,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[2007,3,24,23,59,59],[2007,3,25,1,59,59],
          '2006102900:00:00','2006102902:00:00','2007032423:59:59','2007032501:59:59' ],
     ],
   2007 =>
     [
        [ [2007,3,25,0,0,0],[2007,3,25,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[2007,10,27,23,59,59],[2007,10,28,2,59,59],
          '2007032500:00:00','2007032503:00:00','2007102723:59:59','2007102802:59:59' ],
        [ [2007,10,28,0,0,0],[2007,10,28,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[2008,3,29,23,59,59],[2008,3,30,1,59,59],
          '2007102800:00:00','2007102802:00:00','2008032923:59:59','2008033001:59:59' ],
     ],
   2008 =>
     [
        [ [2008,3,30,0,0,0],[2008,3,30,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[2008,10,25,23,59,59],[2008,10,26,2,59,59],
          '2008033000:00:00','2008033003:00:00','2008102523:59:59','2008102602:59:59' ],
        [ [2008,10,26,0,0,0],[2008,10,26,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[2009,3,28,23,59,59],[2009,3,29,1,59,59],
          '2008102600:00:00','2008102602:00:00','2009032823:59:59','2009032901:59:59' ],
     ],
   2009 =>
     [
        [ [2009,3,29,0,0,0],[2009,3,29,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[2009,10,24,23,59,59],[2009,10,25,2,59,59],
          '2009032900:00:00','2009032903:00:00','2009102423:59:59','2009102502:59:59' ],
        [ [2009,10,25,0,0,0],[2009,10,25,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[2010,3,27,23,59,59],[2010,3,28,1,59,59],
          '2009102500:00:00','2009102502:00:00','2010032723:59:59','2010032801:59:59' ],
     ],
   2010 =>
     [
        [ [2010,3,28,0,0,0],[2010,3,28,3,0,0],'+03:00:00',[3,0,0],
          'EEST',1,[2010,10,30,23,59,59],[2010,10,31,2,59,59],
          '2010032800:00:00','2010032803:00:00','2010103023:59:59','2010103102:59:59' ],
        [ [2010,10,31,0,0,0],[2010,10,31,2,0,0],'+02:00:00',[2,0,0],
          'EET',0,[2011,3,26,23,59,59],[2011,3,27,1,59,59],
          '2010103100:00:00','2010103102:00:00','2011032623:59:59','2011032701:59:59' ],
     ],
   2011 =>
     [
        [ [2011,3,27,0,0,0],[2011,3,27,3,0,0],'+03:00:00',[3,0,0],
          'FET',0,[2014,10,25,21,59,59],[2014,10,26,0,59,59],
          '2011032700:00:00','2011032703:00:00','2014102521:59:59','2014102600:59:59' ],
     ],
   2014 =>
     [
        [ [2014,10,25,22,0,0],[2014,10,26,1,0,0],'+03:00:00',[3,0,0],
          'MSK',0,[9999,12,31,0,0,0],[9999,12,31,3,0,0],
          '2014102522:00:00','2014102601:00:00','9999123100:00:00','9999123103:00:00' ],
     ],
);

%LastRule      = (
);

1;