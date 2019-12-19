#!perl
use strict;
use warnings;

crate(
    crc32fast => '1.2.0',
    requires  => {
        'cfg-if' => '^0.1',
    },
    test => {

        # bencher    => '^0.1', # benchmark, patched
        quickcheck => '^0.6',
        rand       => '^0.4',
    },
    features => {
        default => [qw( std )],
        nightly => [],
        std     => [],
    }
);
