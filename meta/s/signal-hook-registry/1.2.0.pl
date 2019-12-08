#!perl
use strict;
use warnings;

crate(
    'signal-hook-registry' => '1.2.0',
    missing_tests          => 1,
    requires               => {
        'arc-swap' => '~0.4',
        libc       => '~0.2',
    },
    test => {
        'signal-hook'  => '~0.1',
        'version-sync' => '~0.8',
    },
);
