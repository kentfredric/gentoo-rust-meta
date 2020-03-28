#!perl
use strict;
use warnings;

crate(
    thiserror => '1.0.11',
    requires  => {
        'thiserror-impl' => '=1.0.11',
    },
    test => {
        anyhow      => '^1.0',
        'ref-cast'  => '^1.0',
        rustversion => '^1.0',
        trybuild    => '^1.0.19',
    }
);
