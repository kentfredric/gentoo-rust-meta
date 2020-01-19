#!perl
use strict;
use warnings;

my %examples = (
    docopt            => '^0.7',
    'rustc-serialize' => '^0.3',
);
crate(
    walkdir  => '1.0.7',
    requires => {
        'same-file' => '^0.1.1',
    },
    test => {
        quickcheck => '^0.4',

    }
);
