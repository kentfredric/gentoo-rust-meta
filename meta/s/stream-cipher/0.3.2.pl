#!perl
use strict;
use warnings;

crate(
    'stream-cipher' => '0.3.2',
    optional        => {
        blobby => '^0.1',
    },
    requires => {
        'generic-array' => '^0.12',
    },
    features => {
        dev => [qw( blobby )],
        std => [],
    }
);
