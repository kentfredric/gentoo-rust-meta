#!perl
use strict;
use warnings;

crate(
    odds     => '0.3.1',
    requires => {
        rawpointer        => '^0.1.0',
        rawslice          => '^0.1.0',
        'unchecked-index' => '^0.2.2',
    },
    test => {
        itertools  => '^0.7.2',
        quickcheck => '^0.4.1',
    },
    features => {
        default      => [],
        docs         => [qw( std-string std-vec )],
        std          => [],
        'std-string' => [qw( std )],
        'std-vec'    => [qw( std )],
        unstable     => [],
    }
);
