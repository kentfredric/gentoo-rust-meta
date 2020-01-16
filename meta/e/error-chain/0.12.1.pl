#!perl
use strict;
use warnings;

crate(
    'error-chain' => '0.12.1',
    optional      => {
        backtrace => '^0.3.3',
    },
    build_requires => {
        version_check => '^0.1.5',
    },
    features => {
        default           => [qw( backtrace example_generated )],
        example_generated => [],
    }
);
