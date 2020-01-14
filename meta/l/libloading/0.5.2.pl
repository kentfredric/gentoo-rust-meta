#!perl
use strict;
use warnings;

my %windows = ( winapi => '^0.3', );
crate(
    libloading     => '0.5.2',
    build_requires => {
        cc => '^1.0',
    }
);
