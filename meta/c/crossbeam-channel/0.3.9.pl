#!perl
use strict;
use warnings;

crate(
    'crossbeam-channel' => '0.3.9',
    requires            => {
        'crossbeam-utils' => '^0.6.5',
    },
    test => {
        num_cpus      => '^1.10.0',
        rand          => '^0.6',
        'signal-hook' => '^0.1.5',
    }
);
