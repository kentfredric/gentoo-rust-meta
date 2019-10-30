#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted, features missing
    rand_jitter     => '0.1.4',
    missing_tests   => 1,
    missing_options => 1,
    optional        => {
        log => '^0.4',
    },
    requires => {
        rand_core => '^0.4',

        # macos / ios
        # libc => '^0.2'
        # #windows
        # winapi => '^0.3',
    },
    features => {
        std => [qw( rand_core/std )],
    }
);
