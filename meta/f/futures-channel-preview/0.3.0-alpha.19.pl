#!perl
use strict;
use warnings;

# Gentoo: 0.3.0_alpha19
# Upstream: 0.3.0-alpha.19
crate(
    'futures-channel-preview' => '0.3.0.19',
    requires                  => {
        'futures-core-preview' => '=0.3.0.19',
        'futures-sink-preview' => '=0.3.0.19',
    },
    features => {
        alloc => [qw( futures-core-preview/alloc )],
        'cfg-target-has-atomic' =>
          [qw( futures-core-preview/cfg-target-has-atomic )],
        default  => [qw( std )],
        sink     => [qw( futures-sink-preview )],
        std      => [qw( alloc futures-core-preview/std )],
        unstable => [qw( futures-core-preview/unstable )],
    }
);
