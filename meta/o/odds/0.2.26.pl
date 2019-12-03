#!perl
use strict;
use warnings;

crate(
    odds          => '0.2.26',
    missing_tests => 1,
    test          => {
        itertools => '^0.5.1',
    },
    features => {
        default  => [qw( std )],
        std      => [],
        unstable => [],
    }
);
