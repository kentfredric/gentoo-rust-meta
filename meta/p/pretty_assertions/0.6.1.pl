#!perl
use strict;
use warnings;

my %windows = (
    requires => {
        ctor         => '^0.1.7',
        output_vt100 => '^0.1.2',
    }
);
crate(
    pretty_assertions => '0.6.1',
    requires          => {
        ansi_term  => '^0.11',
        difference => '^2.0.0',
    }
);
