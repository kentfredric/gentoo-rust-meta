#!perl
use strict;
use warnings;

crate(
    syn      => '0.15.29',
    requires => {
        'proc-macro2' => '^0.4.4',
    },
    optional => {
        quote => '^0.6',
    },
    features => {
        'clone-impls' => [],
        default =>
          [ 'derive', 'parsing', 'printing', 'clone-impls', 'proc-macro' ],
        derive         => [],
        'extra-traits' => [],
        fold           => [],
        full           => [],
        parsing        => [],
        printing       => ['quote'],
        'proc-macro'   => [ 'proc-macro2/proc-macro', 'quote/proc-macro' ],
        visit          => [],
        'visit-mut'    => [],
    },
);

