#!perl
use strict;
use warnings;

my %benches = (
    fnv         => '^1.0.5',
    lazy_static => '^0.2.8',
);
my %broken_tests = (
    'fst-levenshtein' => '^0.2',
    'fst-regex'       => '^0.2',
);
crate(
    fst      => '0.3.5',
    requires => {
        byteorder => '^1',
    },
    optional => {
        memmap => '^0.6',
    },
    test => {
        quickcheck => '^0.7',
        rand       => '^0.5',
    },
    features => {
        mmap    => [qw( memmap )],
        default => [qw( memmap )],
    }
);
