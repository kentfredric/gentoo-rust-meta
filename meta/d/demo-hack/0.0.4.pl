#!perl
use strict;
use warnings;

crate(
    'demo-hack' => '0.0.4',
    requires    => {
        'proc-macro-hack' => '^0.4',
        'demo-hack-impl'  => '^0.0.4',
    }
);
