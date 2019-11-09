#!perl
use strict;
use warnings;

crate(
    # TODO
    # Note: Tests restricted
    'c2-chacha'   => '0.2.3',
    missing_tests => 1,
    requires      => {
        'ppv-lite86' => '^0.2.6',
    },
    optional => {
        byteorder       => '^1.3',
        'stream-cipher' => '^0.3',

    },
    test => {
        'hex-literal' => '^0.2',
    },
    features => {
        default        => [qw[ std simd rustcrypto_api ]],
        rustcrypto_api => [qw[ stream-cipher byteorder ]],
        simd           => [qw[ ppv-lite86/simd ]],
        std            => [qw[ ppv-lite86/std ]],

      }

);

