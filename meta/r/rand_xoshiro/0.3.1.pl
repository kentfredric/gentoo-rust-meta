#!perl
use strict;
use warnings;

crate(
    rand_xoshiro => '0.3.1',
    requires     => {
        rand_core => '^0.5',
    },
    optional => {
        serde => '^1',
    },
    test => {
        bincode => '^1',
    },
    features => {
        serde1 => [qw( serde )],
    },
);
