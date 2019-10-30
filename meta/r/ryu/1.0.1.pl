#!perl
use strict;
use warnings;

crate(
    ryu      => '1.0.1',
    optional => {
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

