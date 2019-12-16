#!perl
use strict;
use warnings;

crate(
    vec_map  => '0.8.1',
    optional => {
        serde => '^1',
    },
    features => {
        eders => [qw( serde )],
    }
);
