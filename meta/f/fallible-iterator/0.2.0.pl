#!perl
use strict;
use warnings;

crate(
    'fallible-iterator' => '0.2.0',
    features            => {
        alloc   => [],
        default => [qw( std )],
        std     => [],
    }
);
