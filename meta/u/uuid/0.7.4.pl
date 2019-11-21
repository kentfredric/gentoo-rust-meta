#!perl
use strict;
use warnings;

crate(
    uuid     => '0.7.4',
    optional => {
        byteorder => '^1',
        md5       => '^0.6',
        rand      => '^0.6',
        serde     => '^1.0.56',
        sha1      => '^0.6',
        slog      => '^2',
    },
    test => {
        bincode      => '^1',
        serde_derive => '^1.0.79',
        serde_json   => '^1',
        serde_test   => '^1.0.56',
    },
    features => {
        const_fn => [qw( nightly )],
        default  => [qw( std )],

        # windows
        # guid => [qw( winapi )],
        nightly => [],
        std     => [],

        # wasm
        # stdweb => [qw( rand/stdweb )],
        u128 => [qw( byteorder )],
        v1   => [],
        v3   => [qw( md5 )],
        v4   => [qw( rand )],
        v5   => [qw( sha1 )],

        # wasm
        # wasm-bindgen => [qw( rand/wasm-bindgen )],
    }
);
