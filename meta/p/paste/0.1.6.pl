#!perl
use strict;
use warnings;

crate(
    paste    => '0.1.6',
    requires => {
        'paste-impl'      => '=0.1.6',
        'proc-macro-hack' => '^0.5',
    }
);
