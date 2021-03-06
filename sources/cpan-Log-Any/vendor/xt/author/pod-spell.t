use strict;
use warnings;
use Test::More;

# generated by Dist::Zilla::Plugin::Test::PodSpelling 2.007000
use Test::Spelling 0.12;
use Pod::Wordlist;


add_stopwords(<DATA>);
all_pod_files_spelling_ok( qw( bin lib  ) );
__DATA__
alertf
crit
critf
criticalf
debugf
emergencyf
errf
errorf
fatalf
infof
informf
msgs
noticef
passsed
tracef
tranformed
warnf
warningf
Jonathan
Swartz
swartz
David
Golden
dagolden
and
cm
Doug
Bell
madcityzen
Lucas
Kanashiro
kanashiro
Maxim
Vuets
maxim
Stephen
Thirlwall
sdt
lib
Log
Any
Adapter
Base
Development
File
Null
Stderr
Stdout
Test
Util
Manager
Proxy
