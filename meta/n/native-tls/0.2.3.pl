#!perl
use strict;
use warnings;

my %mac = (
    requires => {
        lazy_static              => '^1.0',
        libc                     => '^0.2',
        'security-framework'     => '^0.3.1',
        'security-framework-sys' => '^0.3.1',
        tempfile                 => '^3'
    }
);
my %unixy = (
    requires => {
        log             => '^0.4.5',
        openssl         => '^0.10.15',
        'openssl-probe' => '^0.1',
        'openssl-sys'   => '^0.9.30',
    }
);
my %windows = (
    requires => {
        schannel => '^0.1.13'
    }
);

crate(
    'native-tls' => '0.2.3',
    requires     => { %{ $unixy{requires} } },
    test         => {
        hex => '^0.3',
    },
    features => {
        vendored => [qw( openssl/vendored )],
    }
);
