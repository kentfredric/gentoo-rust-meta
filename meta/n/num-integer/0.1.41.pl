#!perl
use strict;
use warnings;

crate(
    'num-integer' => '0.1.41',
    requires      => {
        'num-traits' => '^0.2.4',
    },
    build_requires => {
        autocfg => '^0.1.3',
    },
    features => {
        default => ['std'],
        i128    => ['num-traits/i128'],
        std     => ['num-traits/std'],
    },
);
