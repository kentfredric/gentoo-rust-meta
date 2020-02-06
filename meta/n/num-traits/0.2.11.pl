#!perl
use strict;
use warnings;

crate(
    'num-traits' => '0.2.11',
    requires     => {
        libm => '^0.2.0',
    },
    build_requires => {
        autocfg => '^1',
    },
    features => {
        default => ['std'],
        i128    => [],
        std     => [],
    }
);

