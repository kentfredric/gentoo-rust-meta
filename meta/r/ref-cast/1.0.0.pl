#!perl
use strict;
use warnings;

crate(
    'ref-cast' => '1.0.0',
    requires   => {
        'ref-cast-impl' => '=1.0.0',
    },
    test => {
        rustversion => '^1',
        trybuild    => '^1',
      }

);
