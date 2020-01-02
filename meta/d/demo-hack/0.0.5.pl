#!perl
use strict;
use warnings;

crate(
    'demo-hack' => '0.0.5',
    requires    => {
        'demo-hack-impl'  => '^0.0.5',
        'proc-macro-hack' => '^0.5',
    }
);
