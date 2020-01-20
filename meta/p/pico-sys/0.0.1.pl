#!perl
use strict;
use warnings;

crate(
    'pico-sys'     => '0.0.1',
    build_requires => {
        gcc => '*',
    },
    requires => {
        libc => '*',
    },

);
