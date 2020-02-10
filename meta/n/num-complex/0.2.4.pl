#!perl
use strict;
use warnings;

crate(
    'num-complex' => '0.2.4',
    requires      => {
        'num-traits' => '^0.2.11',
    },
    optional => {
        rand  => '^0.5',
        serde => '^1.0',
    },
    build_requires => {
        autocfg => '^1',
    },
    features => {
        default => [qw( std )],
        i128    => [qw( num-traits/i128 )],
        std     => [qw( num-traits/std )],
    },
);
