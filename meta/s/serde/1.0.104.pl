#!perl
use strict;
use warnings;

crate(
    serde    => '1.0.104',
    optional => {
        'serde_derive' => '=1.0.104',
    },
    test => {
        'serde_derive' => '^1.0',
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
