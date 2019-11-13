#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests Restricted
    jobserver     => '0.1.17',
    missing_tests => 1,
    requires      => {
        log => '^0.4.6',
    },
    test => {
        futures         => '^0.1',
        num_cpus        => '^1',
        tempdir         => '^0.3',
        'tokio-core'    => '^0.1',
        'tokio-process' => '^0.2',

        # unix
        libc => '^0.2.50',

        # windows
        # getrandom => '^0.1.12',
    }
);
