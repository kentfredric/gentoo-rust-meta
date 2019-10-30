#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted, features missing
    digest          => '0.8.1',
    missing_tests   => 1,
    missing_options => 1,
    requires        => {
        'generic-array' => '^0.12',
    },
    optional => {
        blobby => '^0.1',
    },
    features => {
        dev => [qw( blobby )],
        std => [],
    }
);
