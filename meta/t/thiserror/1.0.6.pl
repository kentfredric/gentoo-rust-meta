#!perl
use strict;
use warnings;

crate(
    thiserror     => '1.0.6',
    missing_tests => 1,
    requires      => {
        'thiserror-impl' => '=1.0.6',
    },
    test => {
        anyhow      => '^1.0',
        'ref-cast'  => '^1.0',
        rustversion => '^1.0',
        trybuild    => '^1.0',
    }
);
