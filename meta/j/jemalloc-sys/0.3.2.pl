#!perl
use strict;
use warnings;

crate(
    'jemalloc-sys' => '0.3.2',
    requires       => {
        libc => '^0.2.8',
    },
    build_requires => {
        cc       => '^1.0.13',
        fs_extra => '^1.1',
    },
    features => {
        background_threads => [qw( background_threads_runtime_support )],
        background_threads_runtime_support => [],
        debug                              => [],
        default                  => [qw( background_threads_runtime_support )],
        disable_initial_exec_tls => [],
        profiling                => [],
        stats                    => [],
        unprefixed_malloc_on_supported_platforms => [],
    }
);

