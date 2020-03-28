#!perl
use strict;
use warnings;

crate(
    synstructure => '0.12.3',
    requires     => {
        'proc-macro2' => '^1',
        quote         => '^1',
        syn           => '^1',
        'unicode-xid' => '^0.2',
    },
    test => {
        synstructure_test_traits => '^0.1',
    },
    features => {
        default => [qw( proc-macro )],
        'proc-macro' =>
          [qw( proc-macro2/proc-macro syn/proc-macro quote/proc-macro )],
    }
);
