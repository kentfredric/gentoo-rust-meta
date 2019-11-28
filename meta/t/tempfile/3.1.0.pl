#!perl
use strict;
use warnings;

crate(
    tempfile => '3.1.0',
    requires => {
        'cfg-if'       => '^0.1',
        rand           => '^0.7',
        remove_dir_all => '^0.5',
        libc           => '^0.2.27',
    }
);
