#!perl
use strict;
use warnings;

crate(
    # TODO
    'block-buffer' => '0.7.3',
    requires       => {
        'block-padding' => '^0.1',
        'byte-tools'    => '^0.3',
        byteorder       => '^1.1',
        'generic-array' => '^0.12',
    }
);
