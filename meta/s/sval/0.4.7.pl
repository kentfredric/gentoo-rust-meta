#!perl
use strict;
use warnings;

crate(
    sval     => '0.4.7',
    optional => {
        serde       => '^1',
        smallvec    => '^0.6',
        sval_derive => '^0.4.7',
    },
    test => {
        quickcheck => '^0.9',
    },
    features => {
        'arbitrary-depth' => [qw( std smallvec )],
        derive            => [qw( sval_derive )],
        fmt               => [],
        serde_no_std      => [qw( serde )],
        serde_std         => [qw( std serde/std )],
        std               => [],
        test              => [qw( std )],
    }
);
