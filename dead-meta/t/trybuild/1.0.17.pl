#!perl
use strict;
use warnings;

crate(
    trybuild => '1.0.17',
    requires => {
        glob        => '^0.3',
        lazy_static => '^1.3',
        serde       => '^1.0',
        serde_json  => '^1.0',
        termcolor   => '^1.0',
        toml        => '^0.5',
    }
);
