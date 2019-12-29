#!perl
use strict;
use warnings;

crate(
    phf      => '0.7.24',
    requires => {
        phf_shared => '^0.7.24',
    },
    optional => {
        phf_macros => '^0.7.24',
    },
    features => {
        core    => [qw( phf_shared/core )],
        macros  => [qw( phf_macros )],
        unicase => [qw( phf_shared/unicase )],
    }
);
