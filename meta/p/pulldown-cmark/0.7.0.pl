#!perl
use strict;
use warnings;

crate(
    'pulldown-cmark' => '0.7.0',
    requires         => {
        bitflags => '^1.2',
        memchr   => '^2.3',
        unicase  => '^2.6',
    },
    optional => {
        getopts => '^0.2',
    },
    test => {
        html5ever   => '^0.24',
        lazy_static => '^1.4',
        regex       => '^1.3',
        tendril     => '^0.4',
    },
    features => {
        default     => [qw( getopts )],
        'gen-tests' => [],
        simd        => [],
    }
);
