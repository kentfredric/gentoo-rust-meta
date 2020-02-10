#!perl
use strict;
use warnings;

crate(
    ntest_timeout => '0.5.1',
    requires      => {
        'proc-macro2' => '^1',
        quote         => '^1',
        syn           => '^1',
    }
);
