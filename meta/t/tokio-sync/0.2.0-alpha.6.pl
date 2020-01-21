#!perl
use strict;
use warnings;

# 0.2.0-alpha.6 / 0.2.0_alpha6
crate(
    'tokio-sync' => '0.2.0.6',
    optional     => {
        'futures-sink-preview' => '=0.3.0.19',
    },
    requires => {
        fnv                    => '^1.0.6',
        'futures-core-preview' => '=0.3.0.19',
        'futures-util-preview' => '=0.3.0.19',
    },
    features => {
        'async-traits' => [qw( futures-sink-preview )],
    }
);
