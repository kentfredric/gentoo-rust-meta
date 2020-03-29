#!perl
use strict;
use warnings;

crate(
    'rayon-core' => '1.6.0',
    requires     => {
        'crossbeam-deque' => '^0.7',
        'crossbeam-queue' => '^0.1.2',
        'crossbeam-utils' => '^0.6.5',
        lazy_static       => '^1',
        num_cpus          => '^1.2',
    },
    test => {
        rand          => '^0.6',
        rand_xorshift => '^0.1',
        'scoped-tls'  => '^1',
        libc          => '^0.2',
    }
);
