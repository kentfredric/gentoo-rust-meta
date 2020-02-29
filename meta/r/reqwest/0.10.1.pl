#!perl
use strict;
use warnings;

my (%not_wasm) = (
    dependencies => {
        base64             => '^0.11',
        encoding_rs        => '^0.8',
        'futures-core'     => '^0.3.0',
        'futures-util'     => '^0.3.0',
        'http-body'        => '^0.3.0',
        hyper              => '^0.13',
        lazy_static        => '^1.4',
        log                => '^0.4',
        mime               => '^0.3.7',
        mime_guess         => '^2.0',
        'percent-encoding' => '^2.1',
        'pin-project-lite' => '^0.1.1',
        serde              => '^1.0',
        serde_urlencoded   => '^0.6.1',
        time               => '^0.1.42',
        tokio              => '^0.2.0',
    },
    optional => {
        'async-compression' => '^0.2.0',
        cookie              => '^0.12',
        cookie_store        => '^0.10',
        'hyper-rustls'      => '^0.19',
        'hyper-tls'         => '^0.4',
        'native-tls'        => '^0.2',
        rustls              => '^0.16',
        serde_json          => '^1.0',
        'tokio-rustls'      => '^0.12',
        'tokio-socks'       => '^0.2',
        'tokio-tls'         => '^0.3.0',
        'webpki-roots'      => '^0.17',
    },
    test => {
        'doc-comment' => "^0.3",
        'env_logger'  => '^0.6',
        hyper         => '^0.13',
        libflate      => '^0.1',
        serde         => '^1',
        tokio         => '^0.2.0',
    }
);
my %wasm = (
    dependencies => {
        'js-sys'               => '^0.3.28',
        'wasm-bindgen'         => '^0.2.51',
        'wasm-bindgen-futures' => '^0.4.1',
        'web-sys'              => '^0.3.25',
    }
);
my %windows = (
    dependencies => {
        'winreg' => '^0.6',
    }
);

crate(
    reqwest  => '0.10.1',
    requires => {
        bytes => '^0.5',
        http  => '^0.2',
        url   => '^2.1',
        %{ $not_wasm{dependencies} }
    },
    optional => { %{ $not_wasm{optional} } },
    test     => { %{ $not_wasm{test} } },
    features => {
        __internal_proxy_sys_no_cache => [],
        __tls                         => [],
        blocking =>
          [qw( futures-util/io tokio/rt-threaded tokio/rt-core tokio/sync )],
        cookies               => [qw( cookie cookie_store )],
        default               => [qw( default-tls )],
        'default-tls'         => [qw( hyper-tls native-tls __tls tokio-tls )],
        gzip                  => [qw( async-compression )],
        json                  => [qw( serde_json )],
        'f_native-tls'        => [qw( default-tls )],
        'native-tls-vendored' => [qw( f_native-tls native-tls/vendored )],
        'rust-tls' =>
          [qw( hyper-rustls tokio-rustls webpki-roots rustls __tls )],
        stream => [],
    }
);
