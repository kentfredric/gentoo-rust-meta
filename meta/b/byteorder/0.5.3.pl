#!perl
use strict;
use warnings;

crate(
    byteorder => '0.5.3',
    test      => {
        quickcheck => '^0.2',
        rand       => '^0.3',
    },
    features => {
        default => [qw( std )],
        std     => [],
    }
);
