#!perl
use strict;
use warnings;

crate(
    pest     => '2.1.2',
    requires => {
        'ucd-trie' => '^0.1.1',
    },
    optional => {
        serde      => '^1.0.89',
        serde_json => '^1.0.39',
    },
    features => {
        'pretty-print' => [qw( serde serde_json )],
    }
);
