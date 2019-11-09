#!perl
use strict;
use warnings;

crate(
    quickcheck => '0.8.5',
    optional   => {
        env_logger => '^0.6',
        log        => '^0.4',
    },
    requires => {
        rand_core => '^0.4',
    },
    features => {
        default     => [qw( regex use_logging )],
        regex       => [qw( env_logger/regex )],
        unstable    => [],
        use_logging => [qw( log env_logger )],
    }
);
