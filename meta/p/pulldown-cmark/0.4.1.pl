#!perl
use strict;
use warnings;

crate(
    'pulldown-cmark' => '0.4.1',
    requires         => {
        bitflags => '^1.0',
        memchr   => '^2.2',
        unicase  => '^2.2.0',
    },
    optional => {
        getopts => '^0.2',
    },
    test => {
        html5ever   => '^0.22',
        lazy_static => '^1.3',
        regex       => '^1.1',
        tendril     => '^0.4',
    },
    features => {
        default     => [qw( getopts )],
        'gen-tests' => [],
    }
);
