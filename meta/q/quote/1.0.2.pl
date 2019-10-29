#!perl
use strict;
use warnings;

crate(
    quote    => '1.0.2',
    requires => {
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
