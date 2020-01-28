#!perl
use strict;
use warnings;

my %bin_cargo_afl = (
    cc   => '^1.0',
    clap => '^2.29',
);
crate(
    afl      => '0.5.2',
    requires => {
        rustc_version => '^0.2',
        xdg           => '^2.1',
    },
    optional       => {%bin_cargo_afl},
    build_requires => {

        #  rustc_version => '^0.2',
        #  xdg           => '^2.1',
    },
    features => {
        'f_cargo-afl' => [qw( cc clap )],
    }
);

