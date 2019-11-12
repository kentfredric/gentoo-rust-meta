#!perl
use strict;
use warnings;

crate(
    quickcheck      => '0.4.1',
    missing_tests   => 1,
    missing_options => 1,
    requires        => {
        rand => '^0.3',
    },
    optional => {
        env_logger => '^0.3',
        log        => '^0.3',
    },
    features => {
        unstable    => [],
        use_logging => [qw( log env_logger )],
        default     => [qw( use_logging )],
    }
);
