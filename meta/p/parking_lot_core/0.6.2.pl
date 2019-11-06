#!perl
use strict;
use warnings;

crate(
    parking_lot_core => '0.6.2',
    requires         => {
        'cfg-if' => '^0.1.5',
        smallvec => '^0.6',

        # cloudabi
        # cloudabi => '^0.0.3',
        # redox
        # redox_syscall => '^0.1',
        # unix
        libc => '^0.2.55',

        # windows
        # winapi => '^0.3',
    },
    build_requires => {
        rustc_version => '^0.2'
    },
    optional => {
        backtrace   => '^0.3.2',
        petgraph    => '^0.4.5',
        'thread-id' => '^3.2.0',
    },
    features => {
        deadlock_detection => [ 'petgraph', 'thread-id', 'backtrace' ],
    }
);
