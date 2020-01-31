#!perl
use strict;
use warnings;

my %unused = (
    test => {
        rayon   => '^1.0',
        walkdir => '^2.1',
    }
);
crate(
    syn      => '0.14.9',
    requires => {
        'proc-macro2' => '^0.4.4',
    },
    optional => {
        quote         => '^0.6',
        'unicode-xid' => '^0.1',
    },
    test     => {},
    features => {
        'clone-impls'  => [],
        'extra-traits' => [],
        default      => [qw( derive parsing printing clone-impls proc-macro )],
        derive       => [],
        fold         => [],
        full         => [],
        parsing      => [qw()],
        printing     => [qw( quote )],
        'proc-macro' => [qw( proc-macro2/proc-macro quote/proc-macro )],
        visit        => [],
        'visit-mut'  => [],
    }
);

