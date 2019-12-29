#!perl
use strict;
use warnings;

crate(
    compiletest_rs => '0.3.26',
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
        tester       => '^0.6',
        libc         => '^0.2',      # unix
                                     # miow => '^0.3' # windows
                                     # winapi => '^0.3', # windows
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

