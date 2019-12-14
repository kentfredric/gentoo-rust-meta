#!perl
use strict;
use warnings;

crate(
    'pulldown-cmark' => '0.1.2',
    requires         => {
        bitflags => '^0.9',
    },
    optional => {
        getopts => '^0.2',
    },
    features => {
        default     => [qw( getopts )],
        'gen-tests' => [],
    }
);

