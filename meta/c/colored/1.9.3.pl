#!perl
use strict;
use warnings;

my %windows = ( winapi => '^0.3', );
crate(
    colored  => '1.9.3',
    requires => {
        atty        => '^0.2.11',
        lazy_static => '^1.4.0',
    },
    test => {
        ansi_term => '^0.12',
        rspec     => '=1.0.0.3',
    },
    features => {
        'no-color' => [],
    }
);
