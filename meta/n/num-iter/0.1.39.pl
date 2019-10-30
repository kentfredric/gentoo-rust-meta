#!perl
use strict;
use warnings;

crate(
    'num-iter' => '0.1.39',
    requires   => {
        'num-integer' => '^0.1.38',
        'num-traits'  => '^0.2.4',
    },
    build_requires => {
        autocfg => '^0.1.3',
    },
    features => {
        default => [qw( std )],
        i128    => [qw( num-integer/i128 num-traits/i128 )],
        std     => [qw( num-integer/std num-traits/std )],
    }
);
