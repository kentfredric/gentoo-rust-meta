#!perl
use strict;
use warnings;

crate(
    remove_dir_all => '0.5.2',
    requires       => {

        # windows && winapi => '^0.3',
    },
    test => {
        'doc-comment' => '^0.3',
    }
);

