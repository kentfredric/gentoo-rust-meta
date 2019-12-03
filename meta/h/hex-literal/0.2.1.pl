#!perl
use strict;
use warnings;

crate(
    'hex-literal' => '0.2.1',
    requires      => {
        'hex-literal-impl' => '^0.2',
        'proc-macro-hack'  => '^0.5',
    }
);

