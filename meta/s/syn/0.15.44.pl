#!perl
use strict;
use warnings;

crate(
    syn      => '0.15.44',
    requires => {
        'proc-macro2' => '^0.4.4',
        'unicode-xid' => '^0.1',
    },
    optional => {
        quote => '^0.6',
    },
    test => {
        insta => '^0.8',

        # patched, removed test
        #rayon      => '^1.0',
        'ref-cast' => '^0.2',

        # patched, removed test
        # regex     => '^1.0',
        termcolor => '^1.0',
        walkdir   => '^2.1',
    },
    features => {
        'clone-impls' => [],
        default       => [qw( derive parsing printing clone-impls proc-macro )],
        derive        => [],
        'extra-traits' => [],
        fold           => [],
        full           => [],
        parsing        => [],
        printing       => [qw( quote )],
        'proc-macro'   => [qw( proc-macro2/proc-macro quote/proc-macro )],
        visit          => [],
        'visit-mut'    => [],
    }
);
