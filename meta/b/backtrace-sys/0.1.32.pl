#!perl
use strict;
use warnings;

my %nightly = (
    optional => {
        compiler_builtins          => '^0.1.2',
        'rustc-std-workspace-core' => '^1',
    },
    features => {
        core               => ['rustc-std-workspace-core'],
        'rustc-dep-of-std' => [qw( core compiler_builtins )]
    }
);
crate(
    'backtrace-sys' => '0.1.32',
    optional        => {},
    requires        => {
        libc => '^0.2',
    },
    build_requires => {
        cc => '^1.0.37',
    },
    features => {}
);
