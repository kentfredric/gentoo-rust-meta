#!perl
use strict;
use warnings;

my %nightly = (
    features => {
        nightly => [],
    }
);
crate(
    'bit-vec' => '0.6.1',
    optional  => {
        serde => '^1.0',
    },
    test => {
        serde_json => '^1.0',
    },
    features => {
        default      => [qw( std )],
        serde_no_std => [qw( serde/alloc )],
        serde_std    => [qw( std serde )],
        std          => [],
    }
);
