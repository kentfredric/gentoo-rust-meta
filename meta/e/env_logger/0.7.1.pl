#!perl
use strict;
use warnings;

crate(
    env_logger => '0.7.1',
    optional   => {
        atty      => '^0.2.5',
        humantime => '^1.3',
        regex     => '^1.0.3',
        termcolor => '^1.0.2',
    },
    requires => {
        log => '^0.4.8',
    },
    features => {
        default => [qw( termcolor atty humantime regex )],
    }
);
