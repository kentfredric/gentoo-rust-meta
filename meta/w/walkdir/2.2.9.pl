#!perl
use strict;
use warnings;

crate(
    # TODO
    walkdir  => '2.2.9',
    requires => {
        'same-file' => '^1.0.1',

        # windows
        # winapi => '^0.3',
        # 'winapi-util' => '^0.1.1',
    },
    test => {
        'doc-comment' => '^0.3',
    },
);
