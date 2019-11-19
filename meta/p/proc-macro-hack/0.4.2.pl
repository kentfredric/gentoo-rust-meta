#!perl
use strict;
use warnings;

crate(
    'proc-macro-hack' => '0.4.2',
    missing_tests     => 1,
    requires          => {
        'proc-macro-hack-impl' => '^0.4',
    },
    test => {
        'demo-hack'      => '^0.0.4',
        'demo-hack-impl' => '^0.0.4',
    },
);

