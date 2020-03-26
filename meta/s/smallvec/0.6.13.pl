#!perl
use strict;
use warnings;

crate(
    smallvec => '0.6.13',
    requires => {
        'maybe-uninit' => '^2.0',
    },
    optional => {
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
