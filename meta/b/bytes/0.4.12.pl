#!perl
use strict;
use warnings;

crate(
    bytes    => '0.4.12',
    requires => {
        byteorder => '^1.1.0',
        iovec     => '^0.1',
    },
    optional => {
        either => '^1.5',
        serde  => '^1.0',
    },
    test => {
        serde_test => '^1.0',
    },
    features => {
        i128 => [qw( byteorder/i128 )],
    }
  )
