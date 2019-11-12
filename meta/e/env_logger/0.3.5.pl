#!perl
use strict;
use warnings;

crate(
    env_logger => '0.3.5',
    requires   => {
        log => '^0.3',
    },
    optional => {
        regex => '^0.1',
    },
    features => {
        default => [qw( regex )],
    }
);
