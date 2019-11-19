#!perl
use strict;
use warnings;

crate(
    rand_isaac => '0.1.1',
    requires   => {
        rand_core => '^0.3',
    },
    optional => {
        serde        => '^1',
        serde_derive => '^1',
    },
    test => {
        bincode => '^1'
    },
    features => {
        serde1 => [ 'serde', 'serde_derive', 'rand_core/serde1' ],
    }
);
