#!perl
use strict;
use warnings;

crate(
    regex           => '0.1.80',
    missing_tests   => 1,
    missing_options => 1,
    requires        => {
        'aho-corasick' => '^0.5.3',
        memchr         => '^0.1.9',
        thread_local   => '^0.2.4',
        'regex-syntax' => '^0.3.8',
        'utf8-ranges'  => '^0.1.3',
    },
    optional => {
        simd => '0.1.0',
    },
    test => {
        lazy_static => '^0.1',
        quickcheck  => '^0.2',
        rand        => '^0.3',
    },
    features => {
        pattern      => [],
        'simd-accel' => [qw( simd )],
    }
);
