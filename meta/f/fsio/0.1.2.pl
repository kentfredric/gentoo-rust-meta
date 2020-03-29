#!perl
use strict;
use warnings;

my %non_windows = (
    optional => {
        users => '^0.9',
    }
);
crate(
    fsio     => '0.1.2',
    optional => {
        rand => '^0.7',
        %{ $non_windows{optional} },
    },
    features => {
        default     => [],
        'temp-path' => [qw( rand users )],
    }
);
