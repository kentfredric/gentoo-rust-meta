#!perl
use strict;
use warnings;

crate(
    lazycell => '1.2.1',
    optional => {

        # clippy => '^0.0' # nightly only
    },
    features => {

        # nightly => [] # nightly
        # 'nightly-testing' => [qw( clippy nightly )] # nightly
    }
);
