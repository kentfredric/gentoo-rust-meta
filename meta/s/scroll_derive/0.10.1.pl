#!perl
use strict;
use warnings;

# Patched in
my %missing = (
    test => {
        'scroll' => '^0.10',
    },
);
crate(
    scroll_derive => '0.10.1',
    requires      => {
        'proc-macro2' => '^1',
        quote         => '^1',
        syn           => '^1',
    },
    test => { %{ $missing{test} }, },
);
