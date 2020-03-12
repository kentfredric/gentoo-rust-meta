#!perl
use strict;
use warnings;

crate(
    rustversion => '1.0.2',
    requires    => {
        'proc-macro2' => '^1',
        quote         => '^1',
        syn           => '^1.0.1',
    }
);
