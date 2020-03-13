#!perl
use strict;
use warnings;

my %added = (
    test => {
        futures => '^0.3',
    }
);
crate(
    'futures-executor' => '0.3.4',
    requires           => {
        'futures-core' => '^0.3.4',
        'futures-task' => '^0.3.4',
        'futures-util' => '^0.3.4',
    },
    optional => {
        num_cpus => '^1.8.0',
    },
    test     => { %{ $added{test} } },
    features => {
        default => [qw( std )],
        std     => [qw( futures-core/std futures-task/std futures-util/std )],
        'thread-pool' => [qw( std num_cpus )],
    }
);
