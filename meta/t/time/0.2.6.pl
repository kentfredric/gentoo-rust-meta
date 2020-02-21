#!perl
use strict;
use warnings;

crate(
    time     => '0.2.6',
    requires => {
        rustversion   => '^1',
        'time-macros' => '^0.1',
    },
    optional => {
        serde => '^1',
    },
    features => {
        default         => [qw( deprecated std )],
        deprecated      => [],
        'panicking-api' => [],
        std             => [],
    }
);
