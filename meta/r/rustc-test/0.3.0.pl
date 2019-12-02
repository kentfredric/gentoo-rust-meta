#!perl
use strict;
use warnings;

crate(
    'rustc-test' => '0.3.0',
    requires     => {
        getopts           => '^0.2',
        libc              => '^0.2',
        'rustc-serialize' => '^0.3',
        term              => '^0.4',
        time              => '^0.1',
    },
    build_requires => {
        rustc_version => '^0.2.1',
    }
);
