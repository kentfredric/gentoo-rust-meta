#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted, missing features
    time            => '0.1.42',
    missing_tests   => 1,
    missing_options => 1,
    requires        => {
        libc => '^0.2.1',

        # windows
        # winapi => '^0.3'
    },
    optional => {
        'rustc-serialize' => '^0.3',
    },
    test => {
        log => '^0.4',

        # windows
        # winapi => '^0.3',
        # redox
        # redox_syscall => '^0.1',
    },
);
