#!perl
use strict;
use warnings;

my %not_emscripten = (
    requires => {
        rand_chacha => '^0.2.1',
    }
);
my %emscripten = (
    requires => {
        rand_hc => '^0.2',
    }
);
my %wasm = (
    features => {
        stdweb         => [qw( getrandom/stdweb )],
        'wasm-bindgen' => [qw( getrandom/wasm-bindgen )],

    }
);
my %unix = (
    optional => {
        libc => '^0.2.22',
    },
);

my %patched = (
    optional => {
        packed_simd => '^0.3',
    },
    features => {
        nightly      => [qw( simd_support )],
        simd_support => [qw( packed_simd )],
    }
);

crate(
    rand     => '0.7.3',
    optional => {
        getrandom => '^0.1.1',
        log       => '^0.4.4',
        rand_pcg  => '^0.2',
        %{ $unix{optional} },

    },
    requires => {
        rand_core => "^0.5.1",
        %{ $not_emscripten{requires} },
    },
    test => {
        rand_hc  => '^0.2',
        rand_pcg => '^0.2',
    },
    features => {
        alloc       => [qw( rand_core/alloc )],
        default     => [qw( std )],
        f_getrandom => [qw( getrandom rand_core/getrandom )],

        serde1 => [],

        small_rng => [qw( rand_pcg )],
        std => [qw( rand_core/std rand_chacha/std alloc f_getrandom libc )],

    }
);
