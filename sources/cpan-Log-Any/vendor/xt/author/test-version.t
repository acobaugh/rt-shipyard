use strict;
use warnings;
use Test::More;

# generated by Dist::Zilla::Plugin::Test::Version 1.05
use Test::Version;

my @imports = qw( version_all_ok );

my $params = {
    is_strict      => 0,
    has_version    => 1,
    multiple       => 0,

};

push @imports, $params
    if version->parse( $Test::Version::VERSION ) >= version->parse('1.002');


Test::Version->import(@imports);

version_all_ok;
done_testing;
