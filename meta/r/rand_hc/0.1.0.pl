#!perl
use strict;
use warnings;

crate(
    rand_hc  => '0.1.0',
    requires => {
        rand_core => '>=0.2, <0.4',
    }
);
