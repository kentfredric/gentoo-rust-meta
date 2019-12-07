#!perl
use strict;
use warnings;

crate(
    'tokio-core' => '0.1.17',
    requires     => {
        bytes            => '^0.4',
        futures          => '^0.1.21',
        iovec            => '^0.1',
        log              => '^0.4',
        mio              => '^0.6.12',
        'scoped-tls'     => '^0.1.0',
        tokio            => '^0.1.5',
        'tokio-executor' => '^0.1.2',
        'tokio-io'       => '^0.1',
        'tokio-reactor'  => '^0.1.1',
        'tokio-timer'    => '^0.2.1',
    },
    test => {
        env_logger => '^0.4',
        libc       => '^0.2',
    }
);
