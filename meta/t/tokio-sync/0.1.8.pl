#!perl
use strict;
use warnings;

my %patched_out = (
    test => {
        env_logger => '^0.6',
    }
);
crate(
    'tokio-sync' => '0.1.8',
    requires     => {
        fnv     => '^1.0.6',
        futures => '^0.1.19',
    },
    test => {
        loom              => '^0.1.1',
        tokio             => '^0.1.15',
        'tokio-mock-task' => '^0.1.1',
    }
);
