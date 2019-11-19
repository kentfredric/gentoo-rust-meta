#!perl
use strict;
use warnings;

crate(
    digest   => '0.8.1',
    requires => {
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
