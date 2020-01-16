#!perl
use strict;
use warnings;

my %benches = ( bencher => '^0.1', );
crate(
    url => '2.1.1',

    requires => {
        idna               => '^0.2.0',
        matches            => '^0.1',
        'percent-encoding' => '^2.1.0',
    },
    optional => {
        serde => '^1.0',
    },
    test => {
        'rustc-test' => '^0.3',
        serde_json   => '^1.0',
    }
);
