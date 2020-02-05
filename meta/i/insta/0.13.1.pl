#!perl
use strict;
use warnings;

crate(
    insta    => '0.13.1',
    requires => {
        console     => '^0.9.0',
        difference  => '^2.0.0',
        lazy_static => '^1.4.0',
        serde       => '^1.0.85',
        serde_json  => '^1.0.36',
        serde_yaml  => '^0.8.8',
    },
    optional => {
        backtrace   => '^0.3.42',
        pest        => '^2.1.0',
        pest_derive => '^2.1.0',
        ron         => '^0.5.1',
    },
    features => {
        default       => [],
        redactions    => [qw( pest pest_derive )],
        serialization => [],
    }
);
