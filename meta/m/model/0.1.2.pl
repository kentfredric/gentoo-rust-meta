#!perl
use strict;
use warnings;

crate(
    model    => '0.1.2',
    requires => {
        permutohedron => '^0.2',
        proptest      => '^0.8',
    }
);
