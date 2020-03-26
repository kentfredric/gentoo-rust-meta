#!perl
use strict;
use warnings;

crate(
    'derive-new' => '0.5.8',
    requires     => {
        'proc-macro2' => '^1',
        quote         => '^1',
        syn           => '^1',
    },
    features => {
        default => [qw( std )],
        std     => [],
    },
);
