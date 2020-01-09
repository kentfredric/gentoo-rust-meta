#!perl
use strict;
use warnings;

crate(
    'ref-cast-impl' => '1.0.0',
    requires        => {
        'proc-macro2' => '^1.0',
        quote         => '^1.0',
        syn           => '^1.0',
    },
);
