#!perl
use strict;
use warnings;

crate(
    quickcheck => '0.5.0',
    optional   => {
        env_logger => '^0.4',
        log        => '^0.3',
    },
    requires => {
        rand => '^0.3',
    },
    features => {
        default     => [qw( use_logging )],
        unstable    => [],
        use_logging => [qw( log env_logger )],
      }

);
