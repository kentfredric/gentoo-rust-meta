#!perl
use strict;
use warnings;

crate(
    ring     => '0.16.9',
    requires => {
        untrusted => '^0.7',

        # various arches
        spin => '^0.5.2',

        # wasm
        # web-sys => '^0.3.25',
        # various unix
        lazy_static => '^1.3',

        # android or linux
        libc => '^0.2.48',

        # windows
        # winapi => '^0.3.7',
    },
    build_requires => {
        cc => '^1.0.37',
    },
    features => {
        alloc                => [],
        default              => [qw( alloc dev_urandom_fallback )],
        dev_urandom_fallback => [qw( lazy_static )],
        internal_benches     => [],
        slow_tests           => [],
        std                  => [qw( alloc )],
        test_logging         => [],
    },
    test => {

        # wasm
        # wasm-bindgen-test

    }
);
