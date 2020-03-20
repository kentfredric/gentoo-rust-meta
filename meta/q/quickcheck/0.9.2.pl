#!perl
use strict;
use warnings;

crate(
    quickcheck => '0.9.2',
    optional   => {
        env_logger => '^0.7',
        log        => '^0.4',
    },
    requires => {
        rand      => '^0.7',
        rand_core => '^0.5',
    },
    features => {
        default     => [qw( regex use_logging )],
        regex       => [qw( env_logger/regex )],
        unstable    => [],
        use_logging => [qw( log env_logger )],
    }
);
