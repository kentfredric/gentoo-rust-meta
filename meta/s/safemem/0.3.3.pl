#!perl
use strict;
use warnings;

crate(
    safemem  => '0.3.3',
    features => {
        default => [qw( std )],
        std     => [],
    }
);
