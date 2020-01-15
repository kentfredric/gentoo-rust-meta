#!perl
use strict;
use warnings;

# Upstream version: 2.0.3+zstd.1.4.4
# Gentoo version: 2.0.3
crate(
    'zstd-safe' => '2.0.3',
    requires    => {
        libc       => '^0.2.21',
        'zstd-sys' => '=1.4.15',
    },
    features => {
        bindgen      => [qw( zstd-sys/bindgen )],
        default      => [qw( legacy )],
        experimental => [qw( zstd-sys/experimental )],
        legacy       => [qw( zstd-sys/legacy )],
        std          => [qw( zstd-sys/std )],
        zstdmt       => [qw( zstd-sys/zstdmt )],
    }
);
