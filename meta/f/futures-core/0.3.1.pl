#!perl
use strict;
use warnings;

crate(
    'futures-core' => '0.3.1',
    features       => {
        alloc                   => [],
        'cfg-target-has-atomic' => [],
        default                 => [qw( std )],
        std                     => [qw( alloc )],
        unstable                => [],
    }
);
