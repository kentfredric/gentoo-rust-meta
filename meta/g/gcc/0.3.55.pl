#!perl
use strict;
use warnings;

crate(
    gcc      => '0.3.55',
    optional => {
        rayon => '^0.8',
    },
    test => {
        tempdir => '^0.3',
    },
    features => {
        parallel => [qw( rayon )],
    },
);
