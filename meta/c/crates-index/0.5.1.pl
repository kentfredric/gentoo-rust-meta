#!perl
use strict;
use warnings;

crate(
    # TODO
    'crates-index' => '0.5.1',
    requires       => {
        git2              => '^0.6',
        glob              => '^0.2.10',
        'rustc-serialize' => '^0.3.14',
    }
);
