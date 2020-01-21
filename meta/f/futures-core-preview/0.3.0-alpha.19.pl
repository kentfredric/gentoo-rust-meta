#!perl
use strict;
use warnings;

# Upstream: 0.3.0-alpha.19
# Gentoo: 0.3.0_alpha19
crate(
    'futures-core-preview' => '0.3.0.19',

    features => {
        alloc                   => [],
        'cfg-target-has-atomic' => [],
        default                 => [qw( std )],
        std                     => [qw( alloc )],
        unstable                => [],
    }
);
