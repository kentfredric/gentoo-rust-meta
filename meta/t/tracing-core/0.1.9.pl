#!perl
use strict;
use warnings;

crate(
    'tracing-core' => '0.1.9',
    optional       => {
        lazy_static => '^1',
    },
    features => {
        default => [qw( std )],
        std     => [qw( lazy_static )],
    }
);
