#!perl
use strict;
use warnings;

crate(
    'libnghttp2-sys' => '0.1.2',
    requires         => {
        libc => '^0.2',
    },
    build_requires => {
        'cc' => '^1.0.24',
    }
);
