#!perl
use strict;
use warnings;

crate(
    phf_shared => '0.8.0',

    requires => {
        siphasher => '^0.3',
    },
    optional => {
        unicase => '^2.4.0',
    },
    features => {
        default => [qw( std )],
        std     => [],
    }
);
