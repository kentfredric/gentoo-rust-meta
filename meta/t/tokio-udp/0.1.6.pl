#!perl
use strict;
use warnings;

crate(
    'tokio-udp' => '0.1.6',
    requires    => {
        bytes           => '^0.4',
        futures         => '^0.1.19',
        log             => '^0.4',
        mio             => '^0.6.14',
        'tokio-codec'   => '^0.1',
        'tokio-io'      => '^0.1.7',
        'tokio-reactor' => '^0.1.1',
    },
    test => {
        env_logger => '^0.6',
    }
);
