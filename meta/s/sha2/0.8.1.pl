#!perl
use strict;
use warnings;

crate(
    sha2     => '0.8.1',
    requires => {
        'block-buffer' => '^0.7',
        digest         => '^0.8',
        'fake-simd'    => '^0.1',
        'opaque-debug' => '^0.2',
    },
    optional => {
        libc       => '^0.2',
        'sha2-asm' => '^0.5',
    },
    test => {
        digest        => '^0.8',
        'hex-literal' => '^0.1',
    },
    features => {
        asm           => [qw( sha2-asm )],
        'asm-aarch64' => [qw( asm libc )],
        default       => [qw( std )],
        std           => [qw( digest/std )],
    },
);
