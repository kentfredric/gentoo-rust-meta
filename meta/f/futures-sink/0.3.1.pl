#!perl
use strict;
use warnings;

crate(
    'futures-sink' => '0.3.1',
    features       => {
        alloc   => [],
        default => [qw( std )],
        std     => [qw( alloc )],
    }
);
