#!perl
use strict;
use warnings;

crate(
    'rusty-fork' => '0.2.2',
    requires     => {
        fnv           => '^1',
        'quick-error' => '^1.2',
        tempfile      => '^3.0',
    },
    optional => {
        'wait-timeout' => '^0.2',
    },
    features => {
        default => [qw( timeout )],
        timeout => [qw( wait-timeout )],
    }
);
