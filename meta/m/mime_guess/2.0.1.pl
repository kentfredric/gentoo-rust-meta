#!perl
use strict;
use warnings;

my %benches = ( criterion => '^0.2', );
crate(
    mime_guess => '2.0.1',
    requires   => {
        mime    => '^0.3',
        unicase => '^2.4.0',
    }
);
