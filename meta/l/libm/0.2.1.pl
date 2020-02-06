#!perl
use strict;
use warnings;

my %need_musl = (
    optional => {
        rand => '^0.6.5',    # optional build requires
    },
    features => {
        'musl-reference-tests' => [qw( rand )],
    },
);
crate(
    libm => '0.2.1',
    test => {
        'no-panic' => '^0.1.8',
    },
    features => {
        default  => [],
        unstable => [],
    }
);
