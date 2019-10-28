#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted
    idna          => '0.1.5',
    missing_tests => 1,
    requires      => {
        matches                 => '^0.1',
        'unicode-bidi'          => '^0.3',
        'unicode-normalization' => '^0.1.5',
    },
    test => {
        'rustc-serialize' => '^0.3',
        'rustc-test'      => '^0.3',
    }
);
