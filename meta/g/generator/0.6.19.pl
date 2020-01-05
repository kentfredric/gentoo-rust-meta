#!perl
use strict;
use warnings;

crate(
    generator      => '0.6.19',
    requires       => { log => '^0.4' },
    build_requires => {
        cc            => '^1.0',
        rustc_version => '^0.2',
        libc          => '^0.2',

        #windows
        #winapi => ^0.3',
    }
);
