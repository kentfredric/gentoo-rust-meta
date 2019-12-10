#!perl
use strict;
use warnings;

crate(
    'tokio-process' => '0.2.4',
    requires        => {
        futures           => '^0.1.11',
        'tokio-io'        => '^0.1',
        'tokio-reactor'   => '^0.1',
        'crossbeam-queue' => '^0.1.2',
        lazy_static       => '^1.3',
        libc              => '^0.2',
        log               => '^0.4',
        mio               => '^0.6.5',
        'tokio-signal'    => '^0.2.5',
    },
    test => {
        failure => '^0.1',
        log     => '^0.4',
        tokio   => '^0.1',
    }
);
