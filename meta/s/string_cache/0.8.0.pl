#!perl
use strict;
use warnings;

crate(
    string_cache => '0.8.0',
    requires     => {
        lazy_static           => '^1',
        new_debug_unreachable => '^1.0',
        phf_shared            => '^0.8',
        'precomputed-hash'    => '^0.1',
        serde                 => '^1',
    },
    test           => {},
    build_requires => {},
    features       => {}
);
