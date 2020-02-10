#!perl
use strict;
use warnings;

crate(
    'lexical-core' => '0.4.6',
    optional       => {
        arrayvec => '^0.4',
        dtoa     => '^0.4',
        ryu      => '^1.0',
    },
    requires => {
        'cfg-if'          => '^0.1',
        static_assertions => '^0.3.3',
    },
    test => {
        approx     => '^0.3.0',
        proptest   => '^0.9.4',
        quickcheck => '^0.8.5',
    },
    build_requires => {
        rustc_version => '^0.2',
    },
    features => {
        correct         => [qw( arrayvec table )],
        default         => [qw( correct ryu std )],
        grisu3          => [qw( dtoa )],
        radix           => [],
        rounding        => [],
        std             => [],
        table           => [],
        trim_floats     => [],
        unchecked_index => [],
    }
);
