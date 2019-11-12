#!perl
use strict;
use warnings;

crate(
    rand     => '0.3.23',
    requires => {
        libc => '^0.2',
        rand => '^0.4',
    },
    features => {
        i128_support => [],
        nightly      => [qw( i128_support )],
    }
);
