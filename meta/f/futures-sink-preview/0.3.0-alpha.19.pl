#!perl
use strict;
use warnings;

# 0.3.0-alpha.19  / 0.3.0_alpha19
crate(
    'futures-sink-preview' => '0.3.0.19',
    features               => {
        alloc   => [],
        default => [],
        std     => [qw( alloc )],
    }
);
