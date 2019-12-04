#!perl
use strict;
use warnings;

crate(
    regex    => '0.2.11',
    requires => {
        'aho-corasick' => '^0.6.0',
        memchr         => '^2.0.0',
        'regex-syntax' => '^0.5.6',
        thread_local   => '^0.3.2',
        'utf8-ranges'  => '^1.0.0',
    },
    test => {
        lazy_static => '^1',
        quickcheck  => '^0.6',
        rand        => '^0.4',
    },
    features => {
        default      => [],
        pattern      => [],
        'simd-accel' => [],
        unstable     => [qw( pattern )],
    }
);
