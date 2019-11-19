#!perl
use strict;
use warnings;

crate(
    rand_core => '0.2.2',
    requires  => {
        rand_core => '^0.3',
    },
    features => {
        alloc  => [qw( rand_core/alloc )],
        serde1 => [qw( rand_core/serde1 )],
        std    => [qw( rand_core/std )],
    }
);
