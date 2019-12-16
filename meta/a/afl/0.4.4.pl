#!perl
use strict;
use warnings;

crate(
    afl      => '0.4.4',
    requires => {
        cc            => '^1.0',
        clap          => '^2.29',
        rustc_version => '^0.2',
        xdg           => '^2.1',
    },
    build_requires => {

        #  rustc_version => '^0.2',
        #  xdg           => '^2.1',
    }
);

