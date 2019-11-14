#!perl
use strict;
use warnings;

crate(
    scroll_derive => '0.9.5',
    requires      => {
        'proc-macro2' => '^0.4',
        quote         => '^0.6',
        syn           => '^0.15',
    },
    test => {
        scroll => '^0.9',
    }
);
