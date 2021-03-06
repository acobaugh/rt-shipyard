
# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v5.019.
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Base classes wrapping fundamental Perl data types.",
  "AUTHOR" => "Matthew Phillips <mattp\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Data-Perl",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Data::Perl",
  "PREREQ_PM" => {
    "Class::Method::Modifiers" => 0,
    "List::MoreUtils" => 0,
    "List::Util" => 0,
    "Module::Runtime" => 0,
    "Role::Tiny" => 0,
    "Scalar::Util" => 0,
    "parent" => 0,
    "strictures" => 0
  },
  "TEST_REQUIRES" => {
    "Test::Deep" => 0,
    "Test::Fatal" => 0,
    "Test::Output" => 0
  },
  "VERSION" => "0.002009",
  "test" => {
    "TESTS" => "t/*.t t/collection/*.t"
  }
);


my %FallbackPrereqs = (
  "Class::Method::Modifiers" => 0,
  "List::MoreUtils" => 0,
  "List::Util" => 0,
  "Module::Runtime" => 0,
  "Role::Tiny" => 0,
  "Scalar::Util" => 0,
  "Test::Deep" => 0,
  "Test::Fatal" => 0,
  "Test::Output" => 0,
  "parent" => 0,
  "strictures" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



