#!perl
use strict;
use warnings;

crate(
    approx   => '0.3.2',
    optional => {
        'num-complex' => '^0.2.0',
    },
    requires => {
        'num-traits' => '^0.2.0'
    },
    features => {
        default => [qw( std )],
        std     => [],
    },
);
