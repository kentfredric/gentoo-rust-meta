#!perl
use strict;
use warnings;

my %benches = (
    tokio           => '^0.1.7',
    'tokio-io-pool' => '=0.1.4',
);
crate(
    'tokio-reactor' => '0.1.12',
    requires        => {
        'crossbeam-utils' => '^0.7',
        futures           => '^0.1.19',
        lazy_static       => '^1.0.2',
        log               => '^0.4.1',
        mio               => '^0.6.14',
        num_cpus          => '^1.8.0',
        parking_lot       => '^0.9.0',
        slab              => '^0.4.0',
        'tokio-executor'  => '^0.1.1',
        'tokio-io'        => '^0.1.6',
        'tokio-sync'      => '^0.1.1',
    },
    test => {
        num_cpus => '^1.8.0',
    }
);
