#!perl
use strict;
use warnings;

crate(
    'tokio-timer' => '0.2.13',
    requires      => {
        'crossbeam-utils' => '^0.7.0',
        futures           => '^0.1.19',
        slab              => '^0.4.1',
        'tokio-executor'  => '^0.1.1',
    },
    test => {
        rand              => '^0.7',
        tokio             => '^0.1.7',
        'tokio-mock-task' => '^0.1',
    },
);
