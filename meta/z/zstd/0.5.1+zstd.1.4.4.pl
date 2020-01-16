#!perl
use strict;
use warnings;

# upstream version: 0.5.1+zstd.1.4.4
# gentoo version: 0.5.1
crate(
    zstd     => '0.5.1',
    requires => {
        'zstd-safe' => '=2.0.3',
    },
    optional => {
        futures    => '^0.1',
        'tokio-io' => '^0.1',
    },
    test => {
        clap         => '^2.0',
        humansize    => '^1.0',
        'partial-io' => '^0.3',
        quickcheck   => '^0.6',
        walkdir      => '^2.2',
    },
    features => {
        bindgen => [qw( zstd-safe/bindgen )],
        default => [qw( legacy )],
        legacy  => [qw( zstd-safe/legacy )],
        tokio   => [qw( tokio-io futures )],
        wasm    => [qw( zstd-safe/std )],
    }
);
