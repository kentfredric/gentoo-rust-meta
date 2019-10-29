#!perl
use strict;
use warnings;

crate(
    # TODO
    cc              => '1.0.46',
    missing_options => 1,
    missing_tests   => 1,
    optional        => {
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
