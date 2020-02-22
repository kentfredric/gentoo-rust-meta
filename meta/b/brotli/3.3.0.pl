#!perl
use strict;
use warnings;

my %nightly = (
    optional => {
        packed_simd => '^0.3',
    },
    features => {
        simd => [qw( packed_simd/into_bits )],
    },
);

crate(
    brotli   => '3.3.0',
    requires => {
        'alloc-no-stdlib'     => '^2.0',
        'brotli-decompressor' => '~2.3',
        'sha2'                => '~0.8',
    },
    optional => {
        'alloc-stdlib' => '~0.2',
    },
    features => {
        benchmark       => [qw( brotli-decompressor/benchmark )],
        default         => [qw( std )],
        'disable-timer' => [qw( brotli-decompressor/disable-timer )],
        'external-literal-probability' => [],
        'pass-through-ffi-panics'      => [],
        seccomp                        => [qw( brotli-decompressor/seccomp )],
        std                  => [qw( alloc-stdlib brotli-decompressor/std )],
        validation           => [qw( sha2 )],
        vector_scratch_space => [],
    }
);

