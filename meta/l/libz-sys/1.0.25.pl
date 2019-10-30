#!perl
use strict;
use warnings;

crate(
    'libz-sys' => '1.0.25',
    requires   => {
        libc => '^0.2.43',
    },
    build_requires => {
        cc           => '^1.0.18',
        'pkg-config' => '^0.3.9',
    },
    features => {
        asm    => [],
        static => [],
    }
);
