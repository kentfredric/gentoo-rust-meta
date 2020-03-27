#!perl
use strict;
use warnings;

crate(
    serde_cbor => '0.11.1',

    requires => {
        half  => '^1.2.0',
        serde => '^1.0.14',
    },
    test => {
        serde_derive => '^1.0.14',
    },
    features => {
        alloc               => [qw( serde/alloc )],
        default             => [qw( std )],
        std                 => [qw( serde/std )],
        tags                => [],
        unsealed_read_write => [],
    }
);
