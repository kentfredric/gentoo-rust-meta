#!perl
use strict;
use warnings;

crate(
    'cfg-if' => '0.1.10',
    optional => {

        # nightly only
        # compiler-builtins => '^0.1.2',
    }
);
