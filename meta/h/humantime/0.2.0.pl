#!perl
use strict;
use warnings;

my %benches = ( chrono => '^0.4', );
crate(
    humantime => '2.0.0',
    requires  => {},
    test      => {
        rand => '^0.6',
        time => '^0.1',
    }
);
