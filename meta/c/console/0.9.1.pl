#!perl
use strict;
use warnings;

crate(
    console  => '0.9.1',
    requires => {
        'clicolors-control' => '^1.0.0',
        lazy_static         => '^1',
        libc                => '^0.2',
        regex               => '^1.3.1',

        # unix
        termios => '^0.3',

        # windows
        # encode_unicode => '^0.3'
        # winapi => '^0.3',
    },
    optional => {
        'unicode-width' => '^0.1',
    },
    features => {
        default => [qw( unicode-width )],
    }
);
