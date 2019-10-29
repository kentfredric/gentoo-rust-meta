#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted, features missing
    chrono          => '0.4.9',
    missing_tests   => 1,
    missing_options => 1,
    requires        => {
        libc          => '^0.2',
        'num-integer' => '^0.1.36',
        'num-traits'  => '^0.2',
    },
    optional => {
        'rustc-serialize' => '^0.3.20',
        serde             => '^1',
        time              => '^0.1.39',

        # wasm32 & !emscripten
        # 'js-sys' => '^0.3'
        # wasm32 & !emscripten
        # 'wasm-bindgen' => '^0.2',
    },
    test => {
        bincode       => '^0.8',
        'doc-comment' => '^0.3',
        'num-iter'    => '^0.1.35',
        serde_derive  => '^1',
        serde_json    => '^1',

        # wasm32 & !emscripten
        # 'wasm-bindgen-test' => '^0.2',
    },
    features => {
        clock   => ['time'],
        default => ['clock'],

        # wasmbind => ['wasm-bindgen', 'js-sys']
    }
);
