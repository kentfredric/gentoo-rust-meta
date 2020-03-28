#!perl
use strict;
use warnings;

crate(
    sval     => '0.5.1',
    optional => {
        serde       => '^1.0.104',
        smallvec    => '^1',
        sval_derive => '^0.5.1',
    },
    test => {
        quickcheck => '^0.9',
    },
    features => {
        alloc             => [],
        'arbitrary-depth' => [qw( alloc smallvec )],
        derive            => [qw( sval_derive )],
        fmt               => [],
        std               => [qw( alloc )],
        test              => [qw( std )],
    }
);
