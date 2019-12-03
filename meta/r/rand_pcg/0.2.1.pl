#!perl
use strict;
use warnings;

crate(
    rand_pcg => '0.2.1',
    requires => {
        rand_core => '^0.5',
    },
    optional => {
        serde => '^1',
    },
    test => {
        bincode => '^1.1.4',
    },
    features => {
        serde1 => [qw( serde )]
    }
);

