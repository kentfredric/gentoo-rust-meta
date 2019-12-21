#!perl
use strict;
use warnings;

crate(
    'demo-hack-impl' => '0.0.4',
    requires         => {
        'proc-macro-hack-impl' => '^0.4',
    }
);
