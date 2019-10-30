#!perl
use strict;
use warnings;

crate(
    pest_generator => '2.1.1',
    requires       => {
        pest          => '^2.1',
        pest_meta     => '^2.1',
        'proc-macro2' => '^1',
        quote         => '^1',
        syn           => '^1',
    }
);
