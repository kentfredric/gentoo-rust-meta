#!perl
use strict;
use warnings;

crate(
    string_cache => '0.7.5',
    requires     => {
        lazy_static           => '^1',
        new_debug_unreachable => '^1.0',
        phf_shared            => '^0.7.4',
        'precomputed-hash'    => '^0.1',
        serde                 => '^1',
        string_cache_shared   => '^0.3',
    },
    test => {
        rand                 => '^0.4',
        string_cache_codegen => '^0.4',
    },
    build_requires => {
        string_cache_codegen => '^0.4'
    },
    features => {
        'log-events' => [],
        unstable     => [],
    }
);
