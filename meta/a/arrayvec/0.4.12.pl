#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted
    arrayvec      => '0.4.12',
    missing_tests => 1,

    requires => {
        nodrop => '^0.1.12',
    },
    optional => {
        serde => '^1',
    },
    test => {
        bencher    => '^0.1.4',
        matches    => '^0.1',
        serde_test => '^1',
    },
    features => {
        'array-sizes-129-255' => [],
        'array-sizes-33-128'  => [],
        default               => [qw( std )],
        'serde-1'             => [qw( serde )],
        std                   => [],
        use_union             => [],
    }
);
