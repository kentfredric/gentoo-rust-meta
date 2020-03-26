#!perl
use strict;
use warnings;

crate(
    derive_builder_core => '0.2.0',
    optional            => {
        log => '^0.3',
    },
    requires => {
        quote => '^0.3',
        syn   => '^0.11',
    },
    test => {
        pretty_assertions => '^0.2',
    },
    features => {
        logging => [qw( log )],
    }
);
