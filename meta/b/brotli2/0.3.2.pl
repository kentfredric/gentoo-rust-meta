#!perl
use strict;
use warnings;

crate(
    brotli2  => '0.3.2',
    requires => {
        'brotli-sys' => '^0.3.1',
        libc         => '^0.2',
    },
    test => {
        quickcheck => '^0.4',
        rand       => '^0.3',
    }
);
