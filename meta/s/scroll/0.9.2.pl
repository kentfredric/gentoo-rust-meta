#!perl
use strict;
use warnings;

crate(
    scroll   => '0.9.2',
    optional => {
        scroll_derive => '^0.9',
    },
    test => {

        # byteorder => '^1', # benches
        # rayon     => '^1', # benches
    },
    build_requires => {
        rustc_version => '^0.2',
    },
    features => {
        default => ["std"],
        derive  => ["scroll_derive"],
        std     => [],
      }

);
