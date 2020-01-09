#!perl
use strict;
use warnings;

crate(
    'brotli-sys' => '0.3.2',
    requires     => {
        libc => '^0.2',
    },
    build_requires => {
        cc => '^1.0',
    }
);
