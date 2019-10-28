#!perl
use strict;
use warnings;

crate(
    console  => '0.8.0',
    requires => {
        'clicolors-control' => '^1',
        lazy_static         => '^1',
        libc                => '^0.2',
        regex               => '^1',
        'unicode-width'     => '^0.1',

        # unix
        termios => '^0.3',

        # windows
        # encode_unicode => '^0.3',
        # windows
        # winapi => '^0.3',
    },
);
