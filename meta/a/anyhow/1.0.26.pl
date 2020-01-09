#!perl
use strict;
use warnings;

crate(
    anyhow => '1.0.26',
    test   => {
        futures     => '^0.3',
        rustversion => '^1',
        thiserror   => '^1',
        trybuild    => '^1',
    },
    features => {
        default => [qw( std )],
        std     => [],
    }
);

