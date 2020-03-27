#!perl
use strict;
use warnings;

my %windows = (
    requires => {
        'winapi-util' => '^0.1.3',
    }
);
crate(
    termcolor => '1.1.0',
    test      => {
        'doc-comment' => '^0.3',
    }
);
