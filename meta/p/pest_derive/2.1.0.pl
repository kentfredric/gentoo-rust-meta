#!perl
use strict;
use warnings;

crate(
    pest_derive => '2.1.0',
    requires    => {
        pest           => '^2.1',
        pest_generator => '^2.1',
    }
);
