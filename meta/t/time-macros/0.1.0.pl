#!perl
use strict;
use warnings;

crate(
    'time-macros' => '0.1.0',
    requires      => {
        'proc-macro-hack'  => '^0.5',
        'time-macros-impl' => '^0.1',
    }
);
