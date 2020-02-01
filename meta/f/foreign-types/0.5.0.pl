#!perl
use strict;
use warnings;

crate(
    'foreign-types' => '0.5.0',
    requires        => {
        'foreign-types-macros' => '^0.2',
        'foreign-types-shared' => '^0.3',
    },
    features => {
        default => [qw( std )],
        std     => [qw( foreign-types-macros/std )],
    },
);
