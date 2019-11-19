#!perl
use strict;
use warnings;

crate(
    # TODO
    rand_pcg => '0.1.2',
    requires => {
        rand_core => '^0.4',
    },
    optional => {
        serde        => '^1',
        serde_derive => '^1.0.38',
    },
    test => {
        bincode => '^1.1.2',
    },
    build_requires => {
        autocfg => '^0.1',
    },
    features => {
        serde1 => [qw( serde serde_derive )]
    },

);
