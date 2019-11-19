#!perl
use strict;
use warnings;

crate(
    'hex-literal' => '0.1.4',
    requires      => {
        'hex-literal-impl' => '^0.1',
        'proc-macro-hack'  => '^0.4',
    }
);

