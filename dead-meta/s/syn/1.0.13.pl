#!perl
use strict;
use warnings;
crate(
    syn => '1.0.13',

    requires => {
        'proc-macro2' => '^1.0.7',

        'unicode-xid' => '^0.2',
    },
    optional => {
        quote => '^1',
    },
    test => {
        anyhow     => '^1.0',
        flate2     => '^1.0',
        insta      => '^0.12',
        rayon      => '^1.0',
        'ref-cast' => '^1',
        regex      => '^1',
        reqwest    => '^0.10',
        tar        => '^0.4',
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

