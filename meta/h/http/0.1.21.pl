#!perl
use strict;
use warnings;

crate(
    http     => '0.1.21',
    requires => {
        bytes => '^0.4',
        fnv   => '^1.0.5',
        itoa  => '^0.4.1',
    },
    test => {
        'doc-comment' => '^0.3',
        indexmap      => '^1.0',
        quickcheck    => '^0.6',
        rand          => '^0.4',
        seahash       => '^3.0.5',
        serde         => '^1.0',
        serde_json    => '^1.0'
    }
);
