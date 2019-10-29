#!perl
use strict;
use warnings;

crate(
    console  => '0.7.7',
    requires => {
        atty                => '^0.2.11',
        'clicolors-control' => '^1',
        lazy_static         => '^1',
        libc                => 'any_subversion(0)',
        parking_lot         => 'any_subversion(0)',
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
