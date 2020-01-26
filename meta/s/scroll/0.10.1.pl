#!perl
use strict;
use warnings;

my %benches = (
    byteorder => '^1',    # benches
    rayon     => '^1',    # benches
);

crate(
    scroll   => '0.10.1',
    optional => {
        scroll_derive => '^0.10',
    },
    test           => {},
    build_requires => {
        rustc_version => '^0.2',
    },
    features => {
        default => ["std"],
        derive  => ["scroll_derive"],
        std     => [],
      }

);
