#!perl
use strict;
use warnings;

crate(
    'futures-executor' => '0.3.1',
    requires           => {
        'futures-core' => '^0.3.1',
        'futures-task' => '^0.3.1',
        'futures-util' => '^0.3.1',
    },
    optional => {
        num_cpus => '^1.8.0',
    },
    features => {
        default => [qw( std )],
        std     => [qw( futures-core/std futures-task/std futures-util/std )],
        'thread-pool' => [qw( std num_cpus )],
    }
);
