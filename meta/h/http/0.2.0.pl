#!perl
use strict;
use warnings;

crate(
    http     => '0.2.0',
    requires => {
        bytes => '^0.5',
        fnv   => '^1.0.5',
        itoa  => '^0.4.1',
    },
    test => {
        'doc-comment' => '^0.3',
        indexmap      => '^1',
        quickcheck    => '^0.9.0',
        rand          => '^0.7.0',
        seahash       => '^3.0.5',
        serde         => '^1.0',
        serde_json    => '^1.0',
    }
);
