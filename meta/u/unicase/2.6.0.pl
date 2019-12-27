#!perl
use strict;
use warnings;

crate(
    unicase        => '2.6.0',
    build_requires => {
        version_check => '^0.9',
    },
    features => {
        nightly => [],
      }

);
