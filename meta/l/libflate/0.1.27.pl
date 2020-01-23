#!perl
use strict;
use warnings;

my %examples = ( clap => '^1', );
crate(
    libflate => '0.1.27',
    requires => {
        adler32           => '^1',
        crc32fast         => '^1',
        'rle-decode-fast' => '^1',
        take_mut          => '^0.2.2',
    }
);
