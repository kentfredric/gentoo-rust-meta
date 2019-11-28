#!perl
use strict;
use warnings;

crate(
    webpki   => '0.21.0',
    requires => {
        ring      => '^0.16',
        untrusted => '^0.7',
    },
    test => {
        base64 => '^0.9.1',
    },
    features => {
        default           => [qw( std trust_anchor_util )],
        std               => [],
        trust_anchor_util => [qw( std )],
    }
);
