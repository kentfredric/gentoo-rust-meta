#!perl
use strict;
use warnings;

crate(
    derefable => '0.1.0',
    requires  => {
        'proc-macro2' => '^0.4.26',
        quote         => '^0.6',
        syn           => '^0.15',
    },
);
