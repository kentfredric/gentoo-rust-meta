#!perl
use strict;
use warnings;

crate(
    proptest => '0.7.2',
    requires => {
        'bit-set'    => '^0.5',
        bitflags     => '^1.0.1',
        lazy_static  => '^1.0.0',
        'num-traits' => '^0.2.2',
        rand         => '^0.4.2',
    },
    optional => {
        'quick-error'  => '^1.2.1',
        'regex-syntax' => '^0.4.2',
        'rusty-fork'   => '^0.2',
        tempfile       => '^3',
    },
    test => {
        regex => '^0.2.5',
    },
    features => {
        alloc   => [],
        default => [qw( std fork timeout )],
        fork    => [qw( std rusty-fork tempfile )],
        nightly => [qw( lazy_static/spin_no_std )],
        std =>
          [qw( rand/std bit-set/std quick-error regex-syntax num-traits/std )],
        timeout  => [qw( fork rusty-fork/timeout )],
        unstable => [qw( rand/i128_support )],
    }
);
