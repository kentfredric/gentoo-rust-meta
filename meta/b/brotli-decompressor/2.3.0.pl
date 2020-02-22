#!perl
use strict;
use warnings;

crate(
    'brotli-decompressor' => '2.3.0',
    requires              => {
        'alloc-no-stdlib' => '~2.0',
    },
    optional => {
        'alloc-stdlib' => '~0.2',
    },
    features => {
        benchmark                 => [],
        default                   => [qw( std )],
        'disable-timer'           => [],
        'pass-through-ffi-panics' => [],
        'seccomp'                 => [],
        std                       => [qw( alloc-stdlib )],
        unsafe => [qw( alloc-no-stdlib/unsafe alloc-stdlib/unsafe )],
    },
);

