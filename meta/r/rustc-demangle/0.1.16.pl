#!perl
use strict;
use warnings;

crate(
    'rustc-demangle' => '0.1.16',
    optional         => {

        # nightly only
        # compiler_builtins => '^0.1.2'
        # 'rustc-std-workspace-core' => '^1',
    },
    features => {

        # nightly only
        # core => ['rustc-std-workspace-core' => '^1',
        # 'rustc-dep-of-std' => [qw( core compiler_builtins )]
    }
);

