#!perl
use strict;
use warnings;

my %unixy = (
    requires => {
        'openssl-probe' => '^0.1.2',
    }
);
my %mac = (
    requires => {
        'security-framework' => '^0.4.0',
    }
);
my %windows = (
    requires => {
        schannel => '^0.1.15',
    }
);
crate(
    'rustls-native-certs' => '0.2.1',
    requires              => {
        rustls => '^0.16.0',
        %{ $unixy{requires} },
    },
    test => {
        ring           => '^0.16.5',
        untrusted      => '^0.7.0',
        webpki         => '^0.21',
        'webpki-roots' => '^0',
    }
);
