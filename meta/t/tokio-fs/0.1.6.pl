#!perl
use strict;
use warnings;

crate(
    'tokio-fs' => '0.1.6',
    requires   => {
        futures            => '^0.1.21',
        'tokio-io'         => '^0.1.6',
        'tokio-threadpool' => '^0.1.3',
    },
    test => {
        rand       => '^0.6',
        tempdir    => '^0.3',
        tempfile   => '^3',
        tokio      => '^0.1.7',
        'tokio-io' => '^0.1.6',
    }
);
