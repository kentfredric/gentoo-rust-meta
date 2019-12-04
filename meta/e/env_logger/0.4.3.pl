#!perl
use strict;
use warnings;

crate(
    env_logger => '0.4.3',
    requires   => {
        log => '^0.3',
    },
    optional => {
        regex => '^0.2',
    },
    features => {
        default => [qw( regex )],
    }
);
