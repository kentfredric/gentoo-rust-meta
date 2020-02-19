#!perl
use strict;
use warnings;

crate(
    serde    => '1.0.89',
    optional => {
        'serde_derive' => '^1',
    },
    test => {
        serde_derive => '^1',
    },
    features => {
        alloc    => ['unstable'],
        default  => ['std'],
        derive   => ['serde_derive'],
        rc       => [],
        std      => [],
        unstable => [],
    },
);
