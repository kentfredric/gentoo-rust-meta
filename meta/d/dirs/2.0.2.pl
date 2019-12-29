#!perl
use strict;
use warnings;

crate(
    dirs     => '2.0.2',
    requires => {
        'cfg-if'   => '^0.1',
        'dirs-sys' => '^0.3.4',
    }
);
