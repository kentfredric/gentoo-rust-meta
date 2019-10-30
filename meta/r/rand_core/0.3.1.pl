#!perl
use strict;
use warnings;

crate(
    rand_core => '0.3.1',
    requires  => {
        rand_core => '^0.4',
    },
    features => {
        alloc   => [qw( rand_core/alloc )],
        default => [qw( std )],
        serde1  => [qw( rand_core/serde1 )],
        std     => [qw( rand_core/std )],
    }
);
