#!perl
use strict;
use warnings;

crate(
    # TODO
    insta    => '0.9.0',
    requires => {
        chrono      => '^0.4.6',
        ci_info     => '^0.3.1',
        console     => '^0.7.5',
        difference  => '^2',
        failure     => '^0.1.5',
        lazy_static => '^1.2',
        pest        => '^2.1',
        pest_derive => '^2.1',
        ron         => '^0.4.1',
        serde       => '^1.0.85',
        serde_json  => '^1.0.36',
        serde_yaml  => '^0.8.8',
        uuid        => '^0.7.1',
    },
    features => {
        serialization => [],
    },
);
