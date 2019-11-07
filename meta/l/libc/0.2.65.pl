#!perl
use strict;
use warnings;

crate(
    libc     => '0.2.65',
    optional => {
        'rustc-std-workspace-core' => '^1',
    },
    features => {
        align              => [],
        default            => ['std'],
        extra_traits       => [],
        'rustc-dep-of-std' => [ 'align', 'rustc-std-workspace-core' ],
        std                => [],
    }
);
