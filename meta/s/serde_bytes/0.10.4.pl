#!perl
use strict;
use warnings;

crate(
    serde_bytes => '0.10.4',
    requires    => {
        serde => '^1',
    },
    test => {
        bincode      => '^0.8',
        serde_derive => '^1',
        serde_test   => '^1',
    },
    features => {
        alloc   => [qw( serde/alloc )],
        default => [qw( std )],
        std     => [qw( serde/std )],
    }
);

