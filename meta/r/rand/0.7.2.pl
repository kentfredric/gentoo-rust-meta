#!perl
use strict;
use warnings;

crate(
    rand     => '0.7.2',
    optional => {
        getrandom => '^0.1.1',
        log       => '^0.4.4',

        # nigthly
        # packed_simd => '^0.3',
        rand_pcg => '^0.2',

    },
    requires => {
        rand_core => "^0.5.1",

        # not emscripten
        rand_chacha => '^0.2.1',

        # emscripten
        # rand_hc => '^0.2.22',

        # unix
        libc => '^0.2.22',
    },
    test => {
        rand_hc => '^0.2',

        # rand_isaac    => '^0.2', # benchmark
        rand_pcg => '^0.2',

        # rand_xorshift => '^0.2', # benchmark
        # rand_xoshiro  => '^0.4', # benchmark
    },
    features => {
        alloc       => [qw( rand_core/alloc )],
        default     => [qw( std )],
        f_getrandom => [qw( getrandom rand_core/getrandom )],

        # Nightly
        # nightly => [qw( simd_support )],
        serde1 => [],

        # Nightly
        # simd_support => [qw( packed_simd )],
        small_rng => [qw( rand_pcg )],
        std       => [qw( rand_core/std rand_chacha/std alloc f_getrandom )],

        # wasm
        #stdweb => [qw( getrandom/stdweb )],
        #'wasm-bindgen' => [qw( getrandom/wasm-bindgen )],
    }
);
