#!perl
use strict;
use warnings;

crate(
    'unicode-width' => '0.1.7',
    optional        => {

        # nightly only
        # compiler_builtins => '^0.1'
        # required by same feature as compiler_builtins
        # 'rustc-std-workspace-core' => '^1.0'
        # required by same feature as compiler_builtins
        # 'rustc-std-workspace-std' => '^1.0',
    },
    features => {
        bench   => [],
        default => [],
        no_std  => [],

        # requires nightly
        # 'rustc-dep-of-std' => [qw( std core compiler_builtins )]
    },
);
