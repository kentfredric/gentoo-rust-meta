#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted
    webpki        => '0.21.0',
    missing_tests => 1,
    requires      => {
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
