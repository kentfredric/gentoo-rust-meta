#!perl
use strict;
use warnings;

crate(
    'thiserror-impl' => '1.0.6',
    requires         => {
        'proc-macro2' => '^1.0',
        quote         => '^1.0',
        syn           => '^1.0',
    }
);
