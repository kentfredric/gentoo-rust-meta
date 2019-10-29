#!perl
use strict;
use warnings;

crate(
    # TODO
    # Note: tests restricted, features missing
    smallvec        => '0.6.10',
    missing_options => 1,
    missing_tests   => 1,
    optional        => {
        serde => '^1',
    },
    test => {
        'bincode' => '^1.0.1',
    },
    features => {
        default        => ['std'],
        may_dangle     => [],
        specialization => [],
        std            => [],
        union          => [],
    },
);
