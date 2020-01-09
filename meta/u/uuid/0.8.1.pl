#!perl
use strict;
use warnings;

crate(
    uuid     => '0.8.1',
    requires => {},
    optional => {
        md5   => '^0.6',
        rand  => '^0.7',
        serde => '^1.0.56',
        sha1  => '^0.6',
        slog  => '^2',

        # windows
        # winapi => '^0.3',
    },
    test => {
        bincode      => '^1.0',
        serde_derive => '^1.0.79',
        serde_json   => '^1.0',
        serde_test   => '^1.0.56',
    },
    features => {
        default => [qw( std )],

        # windows
        #guid           => [qw( winapi )],
        std => [],

        # wasm
        # stdweb         => [qw( rand/stdweb )],
        v1 => [],
        v3 => [qw( md5 )],
        v4 => [qw( rand )],
        v5 => [qw( sha1 )],

        # wasm
        #'wasm-bindgen' => [qw( rand/wasm-bindgen )],
    }
);
