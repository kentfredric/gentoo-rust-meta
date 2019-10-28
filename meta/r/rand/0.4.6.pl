#!perl
use strict;
use warnings;

crate(
    rand     => '0.4.6',
    requires => {

        # env=sgx && rand_core => '^0.3',
        # os=fuchsia && fuchsia-cprng => '^0.1'
        # windows && winapi => '^0.3'
    },
    optional => {
        libc => '^0.2',
    },
    features => {
        alloc        => [],
        default      => ['std'],
        i128_support => [],
        nightly      => ['i128_support'],
        std          => ['libc']
    },

);
