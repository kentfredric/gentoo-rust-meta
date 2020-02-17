#!perl
use strict;
use warnings;

crate(
    'pin-project-internal' => '0.4.8',
    requires               => {
        'proc-macro2' => '^1.0',
        quote         => '^1.0',
        syn           => '^1.0',
    },
);
