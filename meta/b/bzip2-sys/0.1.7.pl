#!perl
use strict;
use warnings;

crate(
    'bzip2-sys' => '0.1.7',
    requires    => {
        libc => '^0.2',
    },
    build_requires => {
        cc => '^1.0',
    }
);
