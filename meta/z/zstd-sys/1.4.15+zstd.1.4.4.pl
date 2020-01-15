#!perl
use strict;
use warnings;

# Gentoo version: 1.4.15
# Upstream version: 1.4.15+zstd.1.4.4
crate(
    'zstd-sys' => '1.4.15',
    requires   => {
        libc => '^0.2.45',
    },
    build_requires => {

        # optional
        bindgen => '^0.51',
        cc      => '^1.0.45',
        glob    => '^0.3',

        # optional
        'pkg-config' => '^0.3',
    },
    features => {
        default      => [qw( legacy )],
        experimental => [],
        legacy       => [],
        'non-cargo'  => [],
        std          => [],
        zstdmt       => [],
    }
);
