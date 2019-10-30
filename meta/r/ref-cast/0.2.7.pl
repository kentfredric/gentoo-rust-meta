#!perl
use strict;
use warnings;

crate(
    # TODO
    'ref-cast' => '0.2.7',
    requires   => {
        'ref-cast-impl' => '=0.2.7',
    },
    test => {
        rustversion => '^0.1',
        trybuild    => '^1.0',
      }

);
