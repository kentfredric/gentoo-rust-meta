#!perl
use strict;
use warnings;

crate(
    rand            => '0.5.6',
    missing_tests   => 1,
    missing_options => 1,
    optional        => {
        log          => '^0.4',
        serde        => '^1',
        serde_derive => '^1',
        libc         => '^0.2',

        # cloudabi
        # cloudabi => '^0.0.3',
        # fuchsia
        # 'fuchsia-cprng' => '^0.1',
        # windows
        # winapi => '^0.3',
        # wasm
        # stdweb => '^0.4',
    },
    requires => {
        rand_core => '^0.3',
    },
    test => {
        bincode => '^1',
    },
    features => {
        alloc        => [qw( rand_core/alloc )],
        default      => [qw( std )],
        i128_support => [],

        # nightly => [qw( i128_support )],
        std => [qw( rand_core/std alloc libc )],

    }
);
