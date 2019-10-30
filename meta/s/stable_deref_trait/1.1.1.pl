#!perl
use strict;
use warnings;

crate(
    stable_deref_trait => '1.1.1',
    features           => {
        alloc   => [],
        default => [qw( std )],
        std     => [],
    }
);

