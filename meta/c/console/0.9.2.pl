#!perl
use strict;
use warnings;

my %unix = (
    requires => {
        termios => '^0.3',
    }
);
my %windows = (
    requires => {
        encode_unicode => '^0.3',
        winapi         => '^0.3',
    }
);
crate(
    console  => '0.9.2',
    requires => {
        'clicolors-control' => '^1.0.1',
        lazy_static         => '^1',
        libc                => '^0.2',
        regex               => '^1.3.1',
        %{ $unix{requires} }
    },
    optional => {
        'unicode-width' => '^0.1',
    },
    features => {
        default => [qw( unicode-width )],
    }
);
