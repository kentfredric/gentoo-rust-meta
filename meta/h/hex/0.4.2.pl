#!perl
use strict;
use warnings;

my %benches = (
    criterion    => '^0.3',
    'faster-hex' => '^0.4',
    'rustc-hex'  => '^2',
);
crate(
    hex      => '0.4.2',
    optional => {
        serde => '^1.0',
    },
    test => {
        pretty_assertions => '^0.6',
        serde             => '^1.0',
        serde_json        => '^1.0',
        'version-sync'    => '^0.8',
    },
    features => {
        default => [qw( std )],
        std     => [],
    },
);
