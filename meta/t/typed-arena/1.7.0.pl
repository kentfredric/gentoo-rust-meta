#!perl
use strict;
use warnings;

crate(
    'typed-arena' => '1.7.0',
    test          => {

        #  criterion => '^0.3', # benches
    },
    features => {
        default => [qw( std )],
        std     => [],
    }
);
