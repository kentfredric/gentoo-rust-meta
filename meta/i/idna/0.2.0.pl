#!perl
use strict;
use warnings;

crate(
    idna     => '0.2.0',
    requires => {
        matches                 => '^0.1',
        'unicode-bidi'          => '^0.3',
        'unicode-normalization' => '^0.1.5',
    },
    test => {
        'rustc-test' => '^0.3',
        serde_json   => '^1',
    }
);

