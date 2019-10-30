#!perl
use strict;
use warnings;

crate(
    either   => '1.5.3',
    optional => {
        serde => '^1',
    },
    features => {
        default => [qw( use_std )],
        use_std => [],
    }
);
