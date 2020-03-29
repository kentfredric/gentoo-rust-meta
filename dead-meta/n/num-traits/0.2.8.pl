#!perl
use strict;
use warnings;

crate(
    'num-traits'   => '0.2.8',
    build_requires => {
        autocfg => '^0.1.3',
    },
    features => {
        default => ['std'],
        i128    => [],
        std     => [],
    }
);

