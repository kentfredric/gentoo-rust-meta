#!perl
use strict;
use warnings;

crate(
    'tokio-sync'  => '0.1.7',
    missing_tests => 1,
    requires      => {
        fnv     => '^1.0.6',
        futures => '^0.1.19',
    },
    test => {
        loom              => '^0.1.1',
        tokio             => '^0.1.15',
        'tokio-mock-task' => '^0.1.1',
    }
);
