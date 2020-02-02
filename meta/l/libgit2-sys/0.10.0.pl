#!perl
use strict;
use warnings;

my %unix = (
    optional => {
        'openssl-sys' => '^0.9',
    },
    features => {
        https => [qw( openssl-sys )],
    }
);
crate(
    'libgit2-sys' => '0.10.0',
    optional      => {
        'libssh2-sys' => '^0.2.11',
        %{ $unix{optional} },
    },
    requires => {
        libc       => '^0.2',
        'libz-sys' => '^1.0.22',
    },
    build_requires => {
        cc           => '^1.0.42',
        'pkg-config' => '^0.3.7',
    },
    features => {
        ssh                 => [qw( libssh2-sys )],
        ssh_key_from_memory => [],
        %{ $unix{features} },
    }
);
