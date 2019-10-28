#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests Restricted
    quote         => '1.0.2',
    missing_tests => 1,
    requires      => {
        'proc-macro2' => '^1.0',
    },
    test => {
        rustversion => '^0.1',
        trybuild    => '^1.0',
    },
    features => {
        default      => ['proc-macro'],
        'proc-macro' => ['proc-macro2/proc-macro'],
    },
);
