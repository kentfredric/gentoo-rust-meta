#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted, features missing
    'sha-1'         => '0.8.1',
    missing_tests   => 1,
    missing_options => 1,
    requires        => {
        'block-buffer' => '^0.7',
        digest         => '^0.8',
        'fake-simd'    => '^0.1',
        'opaque-debug' => '^0.2',
    },
    optional => {
        'sha1-asm' => '^0.4',
    },
    test => {
        'hex-literal' => '^0.1',
    },
    features => {
        asm     => [qw( sha1-asm )],
        default => [qw( std )],
        std     => [qw( digest/std )],
    },
);
