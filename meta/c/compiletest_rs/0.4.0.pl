#!perl
use strict;
use warnings;

my %unix = (
    requires => {
        libc => '^0.2',
    }
);
my %windows = (
    requires => {
        miow   => '^0.3',
        winapi => '^0.3',
    }
);
crate(
    compiletest_rs => '0.4.0',
    requires       => {
        diff         => '^0.1.10',
        filetime     => '^0.2',
        getopts      => '^0.2',
        log          => '^0.4',
        regex        => '^1',
        rustfix      => '^0.4.1',
        serde        => '^1',
        serde_derive => '^1.0',
        serde_json   => '^1',
        tester       => '^0.7',
        %{ $unix{requires} },
    },
    optional => {
        tempfile => '^3',
    },
    features => {
        rustc  => [],
        stable => [],
        tmp    => [qw( tempfile )],

    }
);

