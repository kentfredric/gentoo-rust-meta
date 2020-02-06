#!perl
use strict;
use warnings;

my %benches = ( criterion => '^0.3', );
crate(
    phf_generator => '0.8.0',
    requires      => {
        phf_shared => '^0.8.0',
        rand       => '^0.7',
    }
);
