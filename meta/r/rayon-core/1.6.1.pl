#!perl
use strict;
use warnings;

my %unix = (
    test => {
        libc => '^0.2',
    }
);
crate(
    'rayon-core' => '1.6.1',
    requires     => {
        'crossbeam-deque' => '^0.7.2',
        'crossbeam-queue' => '^0.2',
        'crossbeam-utils' => '^0.7',
        lazy_static       => '^1',
        num_cpus          => '^1.2',
    },
    test => {
        rand          => '^0.6',
        rand_xorshift => '^0.1',
        'scoped-tls'  => '^1',
        %{ $unix{test} }
    },
);
