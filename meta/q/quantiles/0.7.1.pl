#!perl
use strict;
use warnings;

crate(
    quantiles => '0.7.1',
    optional  => {
        serde        => '^1.0',
        serde_derive => '^1.0',
    },
    test => {
        quickcheck => '^0.5',
    },
    features => {
        default       => [],
        serde_support => [qw( serde serde_derive )],
    }
);
