#!perl
use strict;
use warnings;

crate(
    time     => '0.1.42',
    requires => {
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
