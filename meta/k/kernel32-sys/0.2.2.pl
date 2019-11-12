#!perl
use strict;
use warnings;

crate(
    'kernel32-sys' => '0.2.2',
    requires       => {
        'winapi' => '^0.2.5',
    },
    build_requires => {
        'winapi-build' => '^0.1.1',
    }
);
