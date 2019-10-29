#!perl
use strict;
use warnings;

crate(
    failure  => '0.1.6',
    optional => {
        backtrace      => '^0.3.3',
        failure_derive => '^0.1.6',
    },
    features => {
        default => [qw( std derive )],
        derive  => [qw( failure_derive )],
        std     => [qw( backtrace )],
    }
);
