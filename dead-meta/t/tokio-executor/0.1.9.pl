#!perl
use strict;
use warnings;

crate(
    'tokio-executor' => '0.1.9',
    requires         => {
        'crossbeam-utils' => '^0.6.2',
        futures           => '^0.1.19',
    },
    test => {
        tokio => '^0.1.18',
    }
);
