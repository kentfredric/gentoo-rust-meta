#!perl
use strict;
use warnings;

crate(
    parking_lot => '0.9.0',
    requires    => {
        lock_api         => '^0.3.1',
        parking_lot_core => '^0.6',
    },
    build_requires => {
        rustc_version => '^0.2',
    },
    test => {
        bincode     => '^1.1.3',
        lazy_static => '^1',
        rand        => '^0.7',
    },
    features => {
        deadlock_detection => ['parking_lot_core/deadlock_detection'],
        default            => [],
        nightly    => [ 'parking_lot_core/nightly', 'lock_api/nightly' ],
        owning_ref => ['lock_api/owning_ref'],
        serde      => ['lock_api/serde'],
    }
);
