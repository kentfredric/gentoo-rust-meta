#!perl
use strict;
use warnings;

crate(
    trybuild => '1.0.21',
    optional => {
        dissimilar => '^1.0',
    },
    requires => {
        glob        => '^0.3',
        lazy_static => '^1.3',
        serde       => '^1.0.103',
        serde_json  => '^1.0',
        termcolor   => '^1.0.4',
        toml        => '^0.5.2',
    },
    features => {
        diff => [qw( dissimilar )],
    }
);
