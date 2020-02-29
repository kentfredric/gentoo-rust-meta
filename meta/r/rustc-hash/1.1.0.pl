#!perl
use strict;
use warnings;

crate(
    'rustc-hash' => '1.1.0',
    features     => {
        default => [qw( std )],
        std     => [],
    }
);
