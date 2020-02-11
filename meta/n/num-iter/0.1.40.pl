#!perl
use strict;
use warnings;

crate(
    'num-iter' => '0.1.40',
    requires   => {
        'num-integer' => '^0.1.42',
        'num-traits'  => '^0.2.11',
    },
    build_requires => {
        autocfg => '^1',
    },
    features => {
        default => [qw( std )],
        i128    => [qw( num-integer/i128 num-traits/i128 )],
        std     => [qw( num-integer/std num-traits/std )],
    }
);
