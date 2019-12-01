#!perl
use strict;
use warnings;

crate(
    'unicode-bidi' => '0.3.4',
    optional       => {

        # not usable on recent rust, not really used in code usefully
        # flame  => '^0.1',
        #  flamer => '^0.1',
        serde => '>=0.8, <2.0',
    },
    requires => {
        matches => '^0.1',
    },
    test => {
        serde_test => '>=0.8, <2.0',
    },
    features => {
        with_serde => [qw( serde )],

        # See above
        #    flame_it   => [qw( flame flamer )],
        unstable => [],
        default  => [],
        bench_it => [],
    }
);
