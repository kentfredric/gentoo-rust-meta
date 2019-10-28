#!perl
use strict;
use warnings;

crate(
    # TODO
    insta    => '0.11.0',
    requires => {
        console     => '^0.8',
        difference  => '^2',
        lazy_static => '^1.2',
        ron         => '^0.5.1',
        serde       => '^1.0.85',
        serde_json  => '^1.0.36',
        serde_yaml  => '^0.8.8',
        uuid        => '^0.7.1',
    },
    optional => {
        pest        => '^2.1',
        pest_derive => '^2.1',

    },
    features => {
        default       => [],
        redactions    => [qw( pest pest_derive )],
        serialization => [],
    },
);
