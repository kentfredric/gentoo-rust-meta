#!perl
use strict;
use warnings;

crate(
    smallvec => '1.2.0',
    optional => {
        serde => '^1',
    },
    test => {
        'bincode' => '^1.0.1',
    },
    features => {
        may_dangle     => [],
        specialization => [],
        union          => [],
        write          => [],
    },
);
