#!perl
use strict;
use warnings;

crate(
    'futures-io' => '0.3.4',
    features     => {
        default            => [qw( std )],
        'read-initializer' => [],
        std                => [],
        unstable           => [],
    }
);
