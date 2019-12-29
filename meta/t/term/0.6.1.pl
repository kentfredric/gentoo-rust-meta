#!perl
use strict;
use warnings;

crate(
    term     => '0.6.1',
    requires => {
        dirs => '^2.0.1',

        # windows
        # winapi => '^0.3',
    },
    features => {
        default => [],
    }
);
