use strict;
# This is automatically generated by author/import-moose-test.pl.
# DO NOT EDIT THIS FILE. ANY CHANGES WILL BE LOST!!!
use t::lib::MooseCompat;
use warnings;
{
    package ParentClass;
    use Mouse;
}
{
    package SomeClass;
    use base 'ParentClass';
}
{
    package SubClassUseBase;
    use base qw/SomeClass/;
    use Mouse;
}

use Test::More;
use Test::Exception;

lives_ok {
    Mouse->init_meta(for_class => 'SomeClass');
} 'Mouse class => use base => Mouse Class, then Mouse->init_meta on middle class ok';

done_testing;
