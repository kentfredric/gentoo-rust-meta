use 5.006;    # our
use strict;
use warnings;

package Expressions;

our $VERSION = '0.001000';

# ABSTRACT: Syntax for Expressions

# AUTHORITY

sub any_subversion {
    my ($subversion) = @_;
    return sub {

        #largest_version(
        grep { /\A\Q$subversion\E.?/ } @_

          # );
      }
}

sub range_excl {
    my $min = version->parse( $_[0] );
    my $max = version->parse( $_[1] );
    return sub {

        #largest_version(
        grep {
            my $cv = version->parse($_);
            $cv >= $min and $cv < $max
          } @_

          # );
    };
}

sub exact {
    my $wanted = version->parse( ::expando_version( $_[0] ) );
    return sub {
        grep { version->parse($_) eq $wanted } @_;
    };
}

sub larger_than {
    my $wanted = version->parse( ::expando_version( $_[0] ) );
    return sub {
        grep { version->parse($_) gt $wanted } @_;
    };
}

sub smaller_than {
    my $wanted = version->parse( ::expando_version( $_[0] ) );
    return sub {
        grep { version->parse($_) lt $wanted } @_;
    };
}

sub semver {
    my ( $v_prefix, $v_suffix ) = @_;
    my $min = version->parse( ::expando_version("${v_prefix}.${v_suffix}") );
    return sub {

        #  largest_version(
        grep { version->parse($_) >= $min }
          grep /\A\Q${v_prefix}\E([.]|\z)/,
          @_

          # );
    };
}

sub tilde {
    my ( $v_prefix, $v_suffix ) = @_;
    my $min = version->parse( ::expando_version("${v_prefix}.${v_suffix}") );
    my (@max) = split q/\./, $v_prefix;
    $max[-1]++;
    my $zero_suffix = $v_suffix;
    $zero_suffix =~ s/\d+/0/g;
    my $max =
      version->parse( ::expando_version( join q[.], @max, $zero_suffix ) );
    return sub {
        grep {
            my $v = version->parse($_);
            $v >= $min
              and $v < $max
        } @_;
      }
}

sub union_fn {
    my (@fn_parts) = @_;
    return sub {
        my (@versions) = @_;
        for my $fn (@fn_parts) {
            @versions = $fn->(@versions);
        }
        return @versions;
      }
}

sub union {
    my ( $package, @parts ) = @_;
    my (@fn_parts) = map { expr_to_fn( $_, $package ) } @parts;
    return sub {
        my (@versions) = @_;
        for my $fn (@fn_parts) {
            @versions = $fn->(@versions);
        }
        return @versions;
      }
}

sub any_fn {
    my (@fn_parts) = @_;
    return sub {
        my (%todo) = map { ( $_ => 1 ) } @_;
        my (%matched);
        for my $fn (@fn_parts) {
            if ( keys %todo ) {
                for my $match ( $fn->( sort keys %todo ) ) {
                    $matched{$match} = delete $todo{$match};
                }
            }
        }
        return sort keys %matched;
    };
}

sub any {
    my ( $package, @parts );
    any_fn( map { expr_to_fn( $_, $package ) } @parts );
}

sub expr_to_fn {
    my ( $expr, $package ) = @_;
    die "Missing <package>" unless defined $package;
    if ( $expr =~ /\A\s*range_excl\(\s*([0-9.]+)\s*,\s*([0-9.]+)\s*\)\s*\z/ ) {
        return range_excl( $1, $2 );
    }
    if ( $expr =~ /\A\s*any_subversion\(\s*([0-9.]+)\s*\)\s*\z/ ) {
        return any_subversion($1);
    }
    if ( $expr =~ /\A\s*exact\(\s*([0-9][0-9.]*)\s*\)\s*\z/ ) {
        return exact($1);
    }
    if ( $expr =~ /\A\s*=([0-9][0-9.]*)\s*\z/ ) {
        return exact($1);
    }
    if ( $expr =~ /\A\s*>([0-9][0-9.]*)\s*\z/ ) {
        return larger_than($1);
    }
    if ( $expr =~ /\A\s*<([0-9][0-9.]*)\s*\z/ ) {
        return smaller_than($1);
    }
    if ( $expr =~ /\A\s*>=([0-9][0-9.]*)\s*\z/ ) {
        return any_fn( larger_than($1), exact($1) );
    }
    if ( $expr =~ /\A\s*<=([0-9][0-9.]*)\s*\z/ ) {
        return any_fn( smaller_than($1), exact($1) );
    }
    if ( $expr =~ /\A\^(0.[0-9]+)\z/ ) {
        return semver( $1, 0 );
    }
    if ( $expr =~ /\A\^(0.0.[0-9]+)\z/ ) {
        return semver( $1, 0 );
    }
    if ( $expr =~ /\A\^(0.[0-9]+).([0-9][0-9.]*)\z/ ) {
        return semver( $1, $2 );
    }
    if ( $expr =~ /\A\^([0-9]+)\z/ ) {
        return semver( $1, "0.0" );
    }
    if ( $expr =~ /\A\^([0-9]+).([0-9][0-9.]*)\z/ ) {
        return semver( $1, $2 );
    }
    if ( $expr =~ /\A~([0-9]+)\z/ ) {
        return tilde( $1, "0.0" );
    }
    if ( $expr =~ /\A~([0-9]+\.[0-9]+)\z/ ) {
        return tilde( $1, "0" );
    }
    if ( $expr =~ /\A~([0-9]+\.[0-9]+)\.([0-9]+)\z/ ) {
        return tilde( $1, $2 );
    }
    if ( $expr =~ /\A\s*\*\s*\z/ ) {
        return larger_than('0.0.0');
    }

    if ( $expr =~ /\A\s*([^,]+),(.*\z)/ ) {
        return union_fn( expr_to_fn( $1, $package ),
            expr_to_fn( $2, $package ) );
    }

    die "Cannot convert expression <<$expr>> to resolver for $package";
}

1;

