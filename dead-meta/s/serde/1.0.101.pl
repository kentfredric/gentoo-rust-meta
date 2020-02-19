#!perl
use strict;
use warnings;

crate(
    serde    => '1.0.101',
    optional => {
        'serde_derive' => '^1',
    },
    test => {
        'serde_derive' => '^1',
    },
    features => {
        alloc    => [],
        default  => ['std'],
        derive   => ['serde_derive'],
        rc       => [],
        std      => [],
        unstable => [],
    }
);
