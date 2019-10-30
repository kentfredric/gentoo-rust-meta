#!perl
use strict;
use warnings;

crate(
    # TODO
    enum_to_u8_slice_derive => '0.1.1',
    requires                => {
        quote => '^0.3.15',
        syn   => '^0.11.11',
    }
);
