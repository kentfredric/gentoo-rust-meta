#!perl
use strict;
use warnings;

crate(
    env_logger => '0.5.13',
    requires   => {
        atty      => '^0.2.5',
        humantime => '^1.1',
        log       => '^0.4',
        termcolor => '^1',
    },
    optional => {
        regex => '^1.0.3',
    },
    features => {
        default => [qw( regex )],
    }
);
