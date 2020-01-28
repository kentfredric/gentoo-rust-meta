#!perl
use strict;
use warnings;

my %windows = (
    requires => {
        winapi => '^0.3.4',
    },
);

crate(
    ansi_term => '0.12.1',
    optional  => {
        serde => '^1.0.90',
    },
    test => {
        'doc-comment' => '^0.3',
        regex         => '^1.1.9',
        serde_json    => '^1.0.39',
    },
    features => {
        derive_serde_style => [qw( serde )],
    },
);
