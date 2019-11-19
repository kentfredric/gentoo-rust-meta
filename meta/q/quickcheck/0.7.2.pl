#!perl
use strict;
use warnings;

crate(
    quickcheck => '0.7.2',
    optional   => {
        env_logger => '^0.5',
        log        => '^0.4',
    },
    requires => {
        rand      => '^0.5',
        rand_core => '^0.2.1',
    },
    features => {
        default     => [qw( regex use_logging )],
        i128        => [qw( rand/i128_support )],
        regex       => [qw( env_logger/regex )],
        unstable    => [],
        use_logging => [qw( log env_logger )],
    }
);
