#!perl
use strict;
use warnings;

crate(
    'aho-corasick' => '0.5.3',
    missing_tests  => 1,
    requires       => {
        memchr => '^0.1.9',
    },
    test => {

        # example
        # csv => '^0.14',
        # docopt => '^0.6',
        # memmap => '^0.2',
        # 'rustc-serialize' => '^0.3',
        quickcheck => '^0.2',
        rand       => '^0.3',
    }
);
