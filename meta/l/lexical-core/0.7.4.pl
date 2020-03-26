#!perl
use strict;
use warnings;

crate(
    'lexical-core' => '0.7.4',
    optional       => {
        arrayvec          => '^0.5',
        dtoa              => '^0.4',
        ryu               => '^1.0',
        static_assertions => '^1',
    },
    requires => {
        bitflags => '^1.2',
        'cfg-if' => '^0.1',
    },
    test => {
        approx     => '^0.3.0',
        proptest   => '^0.9.4',
        quickcheck => '^0.9.0',
    },
    features => {
        correct         => [qw( arrayvec static_assertions table )],
        default         => [qw( correct ryu std )],
        format          => [qw( static_assertions )],
        grisu3          => [qw( dtoa )],
        noinline        => [],
        radix           => [],
        rounding        => [],
        std             => [],
        table           => [],
        trim_floats     => [],
        unchecked_index => [],
    }
);
