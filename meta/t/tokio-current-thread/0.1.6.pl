#!perl
use strict;
use warnings;

crate(
    'tokio-current-thread' => '0.1.6',
    requires               => {
        futures          => '^0.1.19',
        'tokio-executor' => '^0.1.7',
    }
);

