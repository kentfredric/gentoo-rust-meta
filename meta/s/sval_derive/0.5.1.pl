#!perl
use strict;
use warnings;

crate(
    sval_derive => '0.5.1',
    requires    => {
        'proc-macro2' => '^1',
        quote         => '^1',
        syn           => '^1',
    }
);
