#!perl
use strict;
use warnings;

crate(
    'tokio-tcp' => '0.1.3',
    requires    => {
        bytes           => '^0.4',
        futures         => '^0.1.19',
        iovec           => '^0.1',
        mio             => '^0.6.14',
        'tokio-io'      => '^0.1.6',
        'tokio-reactor' => '^0.1.1',
    },
    test => {
        env_logger => '^0.5',
        tokio      => '^0.1.13',
    },
);
