#!perl
use strict;
use warnings;

crate(
    libc     => '0.2.50',
    optional => {
        'rustc-std-workspace-core' => '^1',
    },
    features => {
        align              => [],
        default            => ['use_std'],
        extra_traits       => [],
        'rustc-dep-of-std' => [ 'align', 'rustc-std-workspace-core' ],
        use_std            => [],
    }
);
