#!perl
use strict;
use warnings;

crate(
    rand     => '0.6.5',
    optional => {
        log => '^0.4',

        #  packed_simd => '^0.3', # nightlyty
        rand_os => '^0.1',
    },
    requires => {
        rand_chacha   => '^0.1',
        rand_core     => '^0.4',
        rand_hc       => '^0.1',
        rand_isaac    => '^0.1',
        rand_jitter   => '^0.1',
        rand_pcg      => '^0.1',
        rand_xorshift => '^0.1',
        libc          => '^0.2',

        # windows
        # winapi => '^0.3',
    },
    test => {
        average      => '^0.9.2',
        rand_xoshiro => '^0.1',
    },
    build_requires => {
        autocfg => '^0.1',
    },
    features => {
        alloc        => [qw( rand_core/alloc )],
        default      => [qw( std )],
        i128_support => [],

        # nightly => [qw( simd_support )],
        serde1 =>
          [qw( rand_core/serde1 rand_isaac/serde1 rand_xorshift/serde1 )],

        # simd_support => [qw( packed_simd )],    # nightly
        std => [qw( rand_core/std alloc rand_os rand_jitter/std )],

        # wasm-bindgen => [qw( rand_os/wasm-bindgen )],
      }

);
