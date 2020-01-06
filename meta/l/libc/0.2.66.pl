#!perl
use strict;
use warnings;

crate(
    libc     => '0.2.66',
    optional => {
        'rustc-std-workspace-core' => '^1',
    },
    features => {
        align              => [],
        'const-extern-fn'  => [],
        default            => ['std'],
        extra_traits       => [],
        'rustc-dep-of-std' => [ 'align', 'rustc-std-workspace-core' ],
        std                => [],
    }
);
