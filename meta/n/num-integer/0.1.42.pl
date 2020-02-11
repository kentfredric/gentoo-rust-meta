#!perl
use strict;
use warnings;

crate(
    'num-integer' => '0.1.42',
    requires      => {
        'num-traits' => '^0.2.11',
    },
    build_requires => {
        autocfg => '^1',
    },
    features => {
        default => ['std'],
        i128    => ['num-traits/i128'],
        std     => ['num-traits/std'],
    },
);
