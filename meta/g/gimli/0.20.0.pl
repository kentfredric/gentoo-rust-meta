#!perl
use strict;
use warnings;

my %example_benches = (
    crossbeam     => '^0.7.1',
    getopts       => '^0.2',
    memmap        => '^0.7',
    num_cpus      => '^1',
    object        => '^0.17',
    rayon         => '^1',
    regex         => '^1',
    'typed-arena' => '^2',
);
crate(
    gimli    => '0.20.0',
    requires => {
        byteorder => '^1',
    },
    optional => {
        arrayvec            => '^0.5.0',
        'fallible-iterator' => '^0.2.0',
        indexmap            => '^1.0.2',
        smallvec            => '^1.1.0',
        stable_deref_trait  => '^1.1.0',
    },
    test => {
        'test-assembler' => '^0.1.3',
    },
    features => {
        alloc   => [qw( fallible-iterator/alloc stable_deref_trait/alloc )],
        default => [qw( read write std )],
        read    => [],
        std     => [qw( fallible-iterator/std stable_deref_trait/std )],
        write   => [qw( std indexmap )],
    }
);
