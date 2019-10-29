#!perl
use strict;
use warnings;

crate(
    'backtrace-sys' => '0.1.31',
    optional        => {

        # nightly only
        # compiler_builtins => '^0.1.2',
        # 'rustc-std-workspace-core' => '^1',
    },
    requires => {
        libc => '^0.2',
    },
    build_requires => {
        cc => '^1.0.37',
    },
    features => {

        # nightly only
        # core => ['rustc-std-workspace-core'],
        # nightly only
        # 'rustc-dep-of-std' => [qw( core compiler_builtins )]
    }
);
