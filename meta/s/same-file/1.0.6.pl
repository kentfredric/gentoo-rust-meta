#!perl
use strict;
use warnings;

my %windows = (
    requires => {
        'winapi-util' => '^0.1.1',
    }
);
crate(
    'same-file' => '1.0.6',
    test        => {
        'doc-comment' => '^0.3',
    },
);
