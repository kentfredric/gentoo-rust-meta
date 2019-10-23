#!perl
use strict;
use warnings;

crate(
    # TODO
    jemallocator  => '0.3.2',
    missing_tests => 1,
    requires      => {
        'jemalloc-sys' => '^0.3.2',
        libc           => '^0.2.8',
    },
    test => {
        paste => '^0.1',
    },
    features => {
        alloc_trait        => [],
        background_threads => [qw( jemalloc-sys/background_threads )],
        background_threads_runtime_support =>
          [qw( jemalloc-sys/background_threads_runtime_support )],
        debug   => [qw( jemalloc-sys/debug )],
        default => [qw( background_threads_runtime_support )],
        disable_initial_exec_tls =>
          [qw( jemalloc-sys/disable_initial_exec_tls )],
        profiling => [qw( jemalloc-sys/profiling )],
        stats     => [qw( jemalloc-sys/stats )],
        unprefixed_malloc_on_supported_platforms =>
          [qw( jemalloc-sys/unprefixed_malloc_on_supported_platforms )],
    }
);

