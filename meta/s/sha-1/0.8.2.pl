#!perl
use strict;
use warnings;

crate(
    'sha-1'  => '0.8.2',
    requires => {
        'block-buffer' => '^0.7',
        digest         => '^0.8',
        'fake-simd'    => '^0.1',
        'opaque-debug' => '^0.2',
    },
    optional => {
        libc       => '^0.2',
        'sha1-asm' => '^0.4',
    },
    test => {
        'hex-literal' => '^0.1',
    },
    features => {
        asm           => [qw( sha1-asm )],
        'asm-aarch64' => [qw( asm libc )],
        default       => [qw( std )],
        std           => [qw( digest/std )],
    },
);
