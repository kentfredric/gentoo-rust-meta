#!perl
use strict;
use warnings;

crate(
    'miniz-sys' => '0.1.12',
    requires    => {
        libc => '^0.2',
    },
    build_requires => {
        cc => '^1',
    }
);
