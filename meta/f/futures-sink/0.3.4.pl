#!perl
use strict;
use warnings;

crate(
    'futures-sink' => '0.3.4',
    features       => {
        alloc   => [],
        default => [qw( std )],
        std     => [qw( alloc )],
    }
);
