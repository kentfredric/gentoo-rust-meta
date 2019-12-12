#!perl
use strict;
use warnings;

crate(
    atlatl   => '0.1.2',
    requires => {
        fnv          => '^1',
        'num-traits' => '^0.2',
    },
    optional => {
        serde => '^1',
    },
    test => {
        fst         => '^0.1',
        lazy_static => '^1.1',
        quickcheck  => '^0.7',
        rand        => '^0.5',
    }
);
