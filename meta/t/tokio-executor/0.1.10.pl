#!perl
use strict;
use warnings;

crate(
    'tokio-executor' => '0.1.10',
    requires         => {
        'crossbeam-utils' => '^0.7.0',
        futures           => '^0.1.19',
    },
    test => {
        tokio => '^0.1.18',
    }
);
