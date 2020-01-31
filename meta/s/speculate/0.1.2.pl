#!perl
use strict;
use warnings;

crate(
    speculate => '0.1.2',
    requires  => {
        'proc-macro2' => '^0.4',
        quote         => '^0.6',
        syn           => '^0.14',
        'unicode-xid' => '^0.1',
    },
    features => {
        default => [],
        nightly => [],
      }

);
