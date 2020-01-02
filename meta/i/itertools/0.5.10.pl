#!perl
use strict;
use warnings;

crate(
    itertools => '0.5.10',
    requires  => {
        either => '^1.0',
    },
    test => {
        quickcheck    => '^0.4',
        permutohedron => '^0.2',
    }
);
