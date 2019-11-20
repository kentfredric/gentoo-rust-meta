#!perl
use strict;
use warnings;

crate(
    custom_derive => '0.1.7',
    test          => {
        'rustc-serialize' => '^0.3.15',
    },
    features => {
        default => [qw( std )],
        std     => [],
    }
);
