#!perl
use strict;
use warnings;

crate(
    'tokio-signal' => '0.2.7',
    requires       => {
        futures          => '^0.1.11',
        mio              => '^0.6.14',
        'tokio-executor' => '^0.1.0',
        'tokio-io'       => '^0.1',
        'tokio-reactor'  => '^0.1',
        libc             => '^0.2',
        'mio-uds'        => '^0.6',
        'signal-hook'    => '^0.1',
    },
    test => {
        tokio => '^0.1.8',
    }
);
