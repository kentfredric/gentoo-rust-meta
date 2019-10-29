#!perl
use strict;
use warnings;

crate(
    'clicolors-control' => '1.0.1',
    requires            => {
        lazy_static => '^1',

        # unix
        libc => '^0.2',

        # windows
        # atty => '^0.2.11',
        # windows
        # winapi => '^0.3',
    },
    features => {
        terminal_autoconfig => [],
        default             => ['terminal_autoconfig'],
    },
);
