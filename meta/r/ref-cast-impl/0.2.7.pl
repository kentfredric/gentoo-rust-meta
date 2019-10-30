#!perl
use strict;
use warnings;

crate(
    'ref-cast-impl' => '0.2.7',
    requires        => {
        'proc-macro2' => '^1',
        quote         => '^1',
        syn           => '^1',
    },
);
