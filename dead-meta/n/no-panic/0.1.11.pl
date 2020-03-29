#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted
    'no-panic'    => '0.1.11',
    missing_tests => 1,
    requires      => {
        'proc-macro2' => '^1.0',
        quote         => '^1.0',
        syn           => '^1.0',
    },
    test => {
        tempfile => '^3',
    }
);
