#!perl
use strict;
use warnings;

crate(
    'arc-swap' => '0.4.4',
    test       => {
        'crossbeam-utils' => '~0.6',
        itertools         => '~0.8',
        model             => '~0.1',
        num_cpus          => '~1',
        once_cell         => '~1',
        proptest          => '~0.8',
        'version-sync'    => '~0.8',
    },
    features => {
        'unstable-weak' => [qw( )],
    }
);
