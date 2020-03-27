#!perl
use strict;
use warnings;

crate(
    lazy_static => '1.1.1',
    optional    => {
        spin => '^0.4.6',
    },
    build_requires => {
        version_check => '^0.1.4',
    },
    features => {
        nightly     => [],
        spin_no_std => [qw( nightly spin )],
    },
);
