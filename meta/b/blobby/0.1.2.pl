#!perl
use strict;
use warnings;

crate(
    blobby   => '0.1.2',
    requires => {
        byteorder => '^1',
    },
    test => {

        # example
        #  hex => '^0.3',
    }
);

