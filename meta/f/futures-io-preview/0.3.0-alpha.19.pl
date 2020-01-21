#!perl
use strict;
use warnings;

# 0.3.0-alpha.19 / 0.3.0_alpha19
crate(
    'futures-io-preview' => '0.3.0.19',
    features             => {
        default          => [qw( std )],
        read_initializer => [],
        std              => [],
        unstable         => [],
    }
);
