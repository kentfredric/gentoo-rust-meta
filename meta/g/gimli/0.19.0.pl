#!perl
use strict;
use warnings;

crate(
    gimli    => '0.19.0',
    requires => {
        arrayvec            => '^0.4.6',
        byteorder           => '^1',
        'fallible-iterator' => '^0.2.0',
        stable_deref_trait  => '^1.1.0',
    },
    optional => {
        indexmap => '^1.0.2',
    },
    test => {
        crossbeam        => '^0.7.1',
        getopts          => '^0.2',
        memmap           => '^0.7',
        num_cpus         => '^1',
        object           => '^0.12',
        rayon            => '^1',
        regex            => '^1',
        'test-assembler' => '^0.1.3',
        'typed-arena'    => '^1',
    },
    features => {
        alloc   => [qw( fallible-iterator/alloc stable_deref_trait/alloc )],
        default => [qw( read write std )],
        read    => [],
        std     => [qw( fallible-iterator/std stable_deref_trait/std )],
        write   => [qw( std indexmap )],
    }
);
