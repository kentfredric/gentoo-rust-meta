#!perl
use strict;
use warnings;

crate(
    syn      => '0.11.11',
    requires => {},
    optional => {
        quote         => '^0.3.7',
        'unicode-xid' => '^0.0.4',
        synom         => '^0.11',
    },
    test => {

    },
    features => {
        default  => [qw( parsing printing)],
        aster    => [],
        full     => [],
        parsing  => [qw( unicode-xid synom )],
        printing => [qw( quote )],
        visit    => [],
        fold     => [],
    }
);

