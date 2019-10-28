#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted
    ryu             => '1.0.1',
    missing_tests   => 1,
    missing_options => 1,
    optional        => {
        'no-panic' => '^0.1',
    },
    test => {
        num_cpus => '^1.8',
        rand     => '^0.5',
    },
    features => {
        'small' => [],
    },
);

