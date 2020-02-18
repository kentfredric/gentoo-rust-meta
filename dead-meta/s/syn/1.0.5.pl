#!perl
use strict;
use warnings;

crate(
    syn      => '1.0.5',
    requires => {
        'proc-macro2' => '^1',
        'unicode-xid' => '^0.2',
    },
    optional => {
        quote => '^1',
    },
    test => {
        insta      => '^0.9',
        rayon      => '^1.0',
        'ref-cast' => '^0.2',
        regex      => '^1',
        termcolor  => '^1',
        walkdir    => '^2.1',
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
    }
);

