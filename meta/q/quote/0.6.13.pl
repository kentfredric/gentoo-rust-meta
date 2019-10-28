#!perl
use strict;
use warnings;

crate(
    quote    => '0.6.13',
    requires => {
        'proc-macro2' => '^0.4.21',
    },
    features => {
        default      => ['proc-macro'],
        'proc-macro' => ['proc-macro2/proc-macro'],
    },
);

