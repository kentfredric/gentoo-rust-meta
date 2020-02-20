#!perl
use strict;
use warnings;

my %benches = ( 'futures-cpupool' => '^0.1.7', );
crate(
    'tokio-threadpool' => '0.1.18',
    requires           => {
        'crossbeam-deque' => '^0.7.0',
        'crossbeam-queue' => '^0.2',
        'crossbeam-utils' => '^0.7.0',
        futures           => '^0.1.19',
        lazy_static       => '^1',
        log               => '^0.4',
        num_cpus          => '^1.2',
        slab              => '^0.4.1',
        'tokio-executor'  => '^0.1.8',
    },
    test => {
        env_logger => '^0.6',
        rand       => '^0.7',
    }
);

