#!perl
use strict;
use warnings;

crate(
    derive_builder => '0.5.1',
    optional       => {
        compiletest_rs => '^0.3.3',
        env_logger     => '^0.4',     # also build optional
        log            => '^0.3',     # also build optional
        skeptic        => '^0.9',     # also build optional
    },
    requires => {
        derive_builder_core => '^0.2',
        quote               => '^0.3',
        syn                 => '^0.11',
    },
    test => {
        pretty_assertions => '^0.2',
    },
    features => {
        logging       => [qw( log env_logger derive_builder_core/logging )],
        nightlytests  => [qw( compiletest_rs )],
        skeptic_tests => [qw( skeptic )],
    },
);

