#!perl
use strict;
use warnings;

crate(
    memchr   => '0.1.11',
    requires => {
        libc => '^0.2.4',
    },
    test => {
        quickcheck => '^0.2',
    },
);
