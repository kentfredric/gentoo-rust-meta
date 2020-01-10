#!perl
use strict;
use warnings;

my %nightly_disabled = (
    optional => {
        compiletest_rs => '^0.3',
        spin           => '^0.4.6',
    },
    features => {
        nightly     => [],
        compiletest => [qw( compiletest_rs )],
        spin_no_std => [qw( nightly spin )],
    }
);

crate(
    lazy_static => '0.2.11',
    optional    => {},
    features    => {}
);
