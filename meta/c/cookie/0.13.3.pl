#!perl
use strict;
use warnings;

crate(
    cookie   => '0.13.3',
    optional => {
        base64             => '^0.11.0',
        'percent-encoding' => '^2.0',
        ring               => '^0.16.0',
    },
    requires => {
        time => '^0.2.6',
    },
    features => {
        'percent-encode' => [qw( percent-encoding )],
        secure           => [qw( ring base64 )],
    }
);
