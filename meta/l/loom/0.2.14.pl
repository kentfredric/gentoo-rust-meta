#!perl
use strict;
use warnings;

crate(
    loom     => '0.2.14',
    requires => {
        'cfg-if'     => '^0.1.6',
        generator    => '^0.6.18',
        'scoped-tls' => '^0.1.2',
    },
    optional => {
        'futures-util' => '^0.3.0',
        serde          => '^1.0.92',
        serde_json     => '^1.0.33',
    },
    features => {
        checkpoint => [qw( serde serde_json )],
        default    => [],
        futures    => [qw( futures-util )],
      }

);
