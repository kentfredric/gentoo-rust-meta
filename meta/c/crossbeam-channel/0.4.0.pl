#!perl
use strict;
use warnings;

crate(
    'crossbeam-channel' => '0.4.0',
    requires            => {
        'crossbeam-utils' => '^0.7',
    },
    test => {
        num_cpus      => '^1.10.0',
        rand          => '^0.6',
        'signal-hook' => '^0.1.5',
    }
);
