#!perl
use strict;
use warnings;

crate(
    rand_core => '0.4.2',
    requires  => {},
    optional  => {
        serde        => '^1',
        serde_derive => '^1.0.38',
    },
    features => {
        alloc  => [],
        serde1 => [qw( serde serde_derive )],
        std    => [qw( alloc )],
    }
);
