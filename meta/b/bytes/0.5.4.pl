#!perl
use strict;
use warnings;

my %not_windows = (
    test => {
        loom => '^0.2.10',
    }
);
crate(
    'bytes'  => '0.5.4',
    optional => {
        serde => '^1.0',
    },
    test => {
        serde_test => '^1.0',
        %{ $not_windows{test} },
    },
    features => {
        default => [qw( std )],
        std     => [],
    }
);
