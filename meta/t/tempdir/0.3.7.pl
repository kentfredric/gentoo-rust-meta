#!perl
use strict;
use warnings;

crate(
    tempdir  => '0.3.7',
    requires => {
        rand           => '^0.4',
        remove_dir_all => '^0.5',
    }
);
