#!perl
use strict;
use warnings;

crate(
    'jemalloc-ctl' => '0.3.3',
    requires       => {
        'jemalloc-sys' => '^0.3.2',
        libc           => '^0.2',
        paste          => '^0.1',
    },
    test => {
        jemallocator => '^0.3.2',
    },
    features => {
        default => [],
        use_std => [qw( libc/use_std )],
    }
);
