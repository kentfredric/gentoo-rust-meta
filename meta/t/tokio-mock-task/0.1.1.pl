#!perl
use strict;
use warnings;

crate(
    'tokio-mock-task' => '0.1.1',
    requires          => {
        futures => '^0.1.21',
    }
);
