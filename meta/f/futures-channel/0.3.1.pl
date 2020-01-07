#!perl
use strict;
use warnings;

crate(
    'futures-channel' => '0.3.1',
    requires          => {
        'futures-core' => '^0.3.1',
    },
    optional => {
        'futures-sink' => '^0.3.1',
    },
    features => {
        alloc                   => [qw( futures-core/alloc )],
        'cfg-target-has-atomic' => [qw( futures-core/cfg-target-has-atomic )],
        default                 => [qw( std )],
        sink                    => [qw( futures-sink )],
        std                     => [qw( alloc futures-core/std )],
        unstable                => [qw( futures-core/unstable )],
    }
  )
