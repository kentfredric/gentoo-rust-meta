#!perl
use strict;
use warnings;

my %windows = (
    winapi        => '^0.3',
    'winapi-util' => '^0.1.1',
);
crate(
    walkdir  => '2.3.1',
    requires => {
        'same-file' => '^1.0.1',
    },
    test => {
        'doc-comment' => '^0.3',
    },
);
