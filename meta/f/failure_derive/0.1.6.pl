#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted
    failure_derive => '0.1.6',
    missing_tests  => 1,
    requires       => {
        'proc-macro2' => '^1',
        quote         => '^1',
        syn           => '^1.0.3',
        synstructure  => '^0.12',
    },
    test => {
        failure => '^0.1',
    },
    features => {
        std => [],
    }
);
