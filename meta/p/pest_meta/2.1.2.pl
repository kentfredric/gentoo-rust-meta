#!perl
use strict;
use warnings;

crate(
    pest_meta => '2.1.2',
    requires  => {
        maplit => '^1',
        pest   => '^2.1',
    },
    build_requires => {
        'sha-1' => '^0.8',
    },
);
