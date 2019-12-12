#!perl
use strict;
use warnings;

crate(
    fst      => '0.1.38',
    requires => {
        byteorder      => '^0.5',
        'regex-syntax' => '^0.3',
        'utf8-ranges'  => '^0.1',
    },
    optional => {
        memmap => '^0.4',
    },
    test => {
        fnv         => '^1',
        lazy_static => '^0.1',
        quickcheck  => '^0.2',
        rand        => '^0.3',
    },
    features => {
        mmap    => [qw( memmap )],
        default => [qw( memmap )],
    }
);
