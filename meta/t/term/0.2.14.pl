#!perl
use strict;
use warnings;

crate(
    term     => '0.2.14',
    requires => {
        winapi         => '^0.2',
        'kernel32-sys' => '^0.2',
    }
);
