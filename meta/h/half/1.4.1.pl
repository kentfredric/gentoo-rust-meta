#!perl
use strict;
use warnings;

crate(
    half     => '1.4.1',
    optional => {
        serde => '^1',
    },
    test => {
        quickcheck        => '^0.9',
        quickcheck_macros => '^0.8',
        rand              => '^0.7',
        'version-sync'    => '^0.8.1',
    },
    features => {
        serialize        => [qw( serde )],
        std              => [],
        'use-intrinsics' => [],
    }
);
