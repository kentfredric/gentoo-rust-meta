#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted, some features missing
    'unicode-bidi'  => '0.3.4',
    missing_tests   => 1,
    missing_options => 1,
    optional        => {
        flame  => '^0.1',
        flamer => '^0.1',
        serde  => '>=0.8, <2.0',
    },
    requires => {
        matches => '^0.1',
    },
    test => {
        serde_test => '>=0.8, <2.0',
    },
    features => {
        with_serde => [qw( serde )],
        flame_it   => [qw( flame flamer )],
        unstable   => [],
        default    => [],
        bench_it   => [],
    }
);
