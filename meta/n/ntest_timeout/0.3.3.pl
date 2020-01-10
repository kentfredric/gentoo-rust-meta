#!perl
use strict;
use warnings;

crate(
    ntest_timeout => '0.3.3',
    requires      => {
        'proc-macro2' => '^1',
        quote         => '^1',
        syn           => '^1',
        timebomb      => '^0.1.2',
    }
);
