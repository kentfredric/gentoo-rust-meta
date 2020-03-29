#!perl
use strict;
use warnings;

crate(
    jobserver => '0.1.17',
    requires  => {
        log => '^0.4.6',

        # unix
        libc => '^0.2.50',

    },
    test => {
        futures         => '^0.1',
        num_cpus        => '^1',
        tempdir         => '^0.3',
        'tokio-core'    => '^0.1',
        'tokio-process' => '^0.2',

        # windows
        # getrandom => '^0.1.12',
    }
);
