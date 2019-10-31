#!perl
use strict;
use warnings;

crate(
    # TODO
    mesalink => '1.1.0',    # -cratesio
    requires => {
        base64                  => '^0.10',
        bitflags                => '^1',
        enum_to_u8_slice_derive => '^0.1',
        env_logger              => '^0.6',
        lazy_static             => '^1',
        libc                    => '^0.2',
        parking_lot             => '^0.9',
        ring                    => '^0.16',
        rustls                  => '^0.16',
        sct                     => '^0.6',
        untrusted               => '^0.7',
        webpki                  => '^0.21',
        'webpki-roots'          => '^0.17',
    },
    optional => {
        jemallocator => '^0.3',
    },
    test => {
        log => '^0.4',
    },
    build_requires => {
        walkdir => '^2',
    },
    features => {
        aesgcm      => [],
        chachapoly  => [],
        client_apis => [],
        default     => [
            qw( client_apis server_apis error_strings tls13 aesgcm chachapoly x25519 ecdh ecdsa verifier )
        ],
        ecdh               => [],
        ecdsa              => [],
        error_strings      => [],
        forked_deps        => [],
        jemalloc_allocator => [qw( jemallocator )],
        nightly            => [],
        server_apis        => [],
        tls13              => [],
        verifier           => [qw( rustls/dangerous_configuration )],
        x25519             => []
      }

);
