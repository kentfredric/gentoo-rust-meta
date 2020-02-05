#!perl
use strict;
use warnings;

crate(
    intervaltree => '0.2.5',
    requires     => {
        smallvec => '^1',
    },
    features => {
        default => [qw( std )],
        std     => [],
    }
);
