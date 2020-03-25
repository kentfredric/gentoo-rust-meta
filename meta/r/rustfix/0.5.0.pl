#!perl
use strict;
use warnings;

crate(
    rustfix  => '0.5.0',
    requires => {
        anyhow     => '^1.0.0',
        log        => '^0.4.1',
        serde      => '^1.0',
        serde_json => '^1.0',
    },
    test => {

        # difference => '^2.0.0',
        # duct       => '^0.9',
        # env_logger => '^0.5.0',
        # log        => '^0.4.1',
        proptest => '^0.7.0',

        #tempdir    => '^0.3.5',
    }
);
