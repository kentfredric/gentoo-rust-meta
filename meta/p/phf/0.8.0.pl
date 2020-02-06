#!perl
use strict;
use warnings;

crate(
    phf      => '0.8.0',
    requires => {
        phf_shared => '^0.8.0',
    },
    optional => {
        phf_macros        => '^0.8.0',
        'proc-macro-hack' => '^0.5.4',
    },
    features => {
        default => [qw( std )],
        macros  => [qw( phf_macros proc-macro-hack )],
        std     => [qw( phf_shared/std )],
        unicase => [qw( phf_shared/unicase )],
    }
);
