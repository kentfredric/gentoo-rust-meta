#!perl
use strict;
use warnings;

crate(
    which    => '3.1.0',
    optional => {
        failure => '^0.1.6',
    },
    requires => {
        libc => '^0.2.65',
    },
    test => {
        tempdir => '^0.3.7',
    },
    features => {
        default => [qw( failure )],
    }
);
