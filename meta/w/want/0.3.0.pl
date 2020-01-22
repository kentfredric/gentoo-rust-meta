#!perl
use strict;
use warnings;

crate(
    want     => '0.3.0',
    requires => {
        log        => '^0.4',
        'try-lock' => '^0.2',
    },
    test => {
        'tokio-executor' => '^0.2.0.2',    # 0.2.0-alpha.2 aka 0.2.0_alpha2
        'tokio-sync'     => '^0.2.0.2',    # 0.2.0-alpha.2 aka 0.2.0_alpha2
    }
);
