#!perl
use strict;
use warnings;

my %windows = (
    requires => {
        'kernel32-sys' => '^0.2',
        winapi         => '^0.2',
    }
);
crate(
    'same-file' => '0.1.3',

    test => { rand => '^0.3', }
);
