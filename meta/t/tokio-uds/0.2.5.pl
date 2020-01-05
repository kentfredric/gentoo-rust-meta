#!perl
use strict;
use warnings;

crate(
    'tokio-uds' => '0.2.5',
    requires    => {
        bytes           => '^0.4.8',
        futures         => '^0.1.21',
        iovec           => '^0.1.2',
        libc            => '^0.2.42',
        log             => '^0.4.2',
        mio             => '^0.6.14',
        'mio-uds'       => '^0.6.5',
        'tokio-codec'   => '^0.1.0',
        'tokio-io'      => '^0.1.6',
        'tokio-reactor' => '^0.1.1',
    },
    test => {
        tempfile => '^3',
        tokio    => '^0.1.6',
    },
);
