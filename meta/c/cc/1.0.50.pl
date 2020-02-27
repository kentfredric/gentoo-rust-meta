#!perl
use strict;
use warnings;

crate(
    cc       => '1.0.50',
    optional => {
        jobserver => '^0.1.16',
    },
    test => {
        tempfile => '^3',
    },
    features => {
        parallel => [qw( jobserver )],
    }
);
