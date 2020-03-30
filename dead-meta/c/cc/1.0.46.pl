#!perl
use strict;
use warnings;

crate(
    cc       => '1.0.46',
    optional => {
        jobserver => '^0.1.16',
        num_cpus  => '^1.10',
    },
    test => {
        tempdir => '^0.3',
    },
    features => {
        parallel => [qw( num_cpus jobserver )],
    }
);
