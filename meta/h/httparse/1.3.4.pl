#!perl
use strict;
use warnings;

crate(
    httparse => '1.3.4',
    test     => {
        'pico-sys' => '^0.0',
    },
    features => {
        default => [qw( std )],
        std     => [],
    }
);
