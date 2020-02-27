#!perl
use strict;
use warnings;

crate(
    'tokio-io' => '0.1.13',
    requires   => {
        bytes   => '^0.4.7',
        futures => '^0.1.18',
        log     => '^0.4',
    },
    test => {
        'tokio-current-thread' => '^0.1.1',
    }
);
