#!perl
use strict;
use warnings;

crate(
    rustversion => '0.1.4',

    requires => {
        'proc-macro2' => '^1.0',
        quote         => '^1.0',
        syn           => '^1.0',
    },
);

