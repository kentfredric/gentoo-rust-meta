#!perl
use strict;
use warnings;

crate(
    heapsize => '0.3.9',

    requires => {

        # 'kernel32-sys' => '^0.2.1', # windows
    },
    features => {
        unstable => [],
    }
);
