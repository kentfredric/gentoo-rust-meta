#!perl
use strict;
use warnings;

crate(
    findshlibs => '0.5.0',
    requires   => {
        lazy_static => '^1',
        libc        => '^0.2.55',
    },
    features => {
        nightly => [],
    }
);
