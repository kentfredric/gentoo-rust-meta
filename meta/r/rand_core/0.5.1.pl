#!perl
use strict;
use warnings;

crate(
    rand_core => '0.5.1',
    requires  => {},
    optional  => {
        getrandom => '^0.1',
        serde     => '^1',
    },
    features => {
        alloc  => [],
        serde1 => [qw( serde )],
        std    => [qw( alloc getrandom getrandom/std )],
    }
);
