#!perl
use strict;
use warnings;

use Data::Dump qw(pp);
my $graph = load_graph();

my %node_versions;

for my $node ( sort keys %{$graph} ) {
    my ( $name, $version ) = split q[//], $node;
    $node_versions{$name}{$version} = 1;
}
for my $name ( sort keys %node_versions ) {
    $node_versions{$name} =
      [ sort { vsort( $a, $b ) } keys %{ $node_versions{$name} } ];
}

for my $node ( sort keys %{$graph} ) {
    my ( $name, $version ) = split q[//], $node;
    my $node_data = $graph->{$node};
    if (   not exists $node_data->{inbound}
        or not keys %{ $node_data->{inbound} } )
    {
        # Don't report if is latest
        if ( $version eq $node_versions{$name}->[-1] ) {
            next;
        }
        my $node_list = join q[, ],
          map { $_ eq $version ? "\e[1;32m" . $_ . "\e[0m" : $_ }
          @{ $node_versions{$name} };

        warn "$node \e[31m>\e[0m $node_list\n";

        next;
    }
}

use Data::Dump qw(pp);

sub vsort {
    my ( $left, $right ) = @_;
    my (@lparts) = ( split qr/\./, $left );
    my (@rparts) = ( split qr/\./, $right );
    my ($min) = $#lparts <= $#rparts ? $#lparts : $#rparts;

    for my $i ( 0 .. $min ) {
        my $cmp = ( $lparts[$i] <=> $rparts[$i] );
        next if $cmp == 0;
        return $cmp;
    }

    # If the same-length prefixes are identical, then the longer
    # version is the bigger one
    ( scalar @lparts ) <=> ( scalar @rparts );
}

sub load_graph {
    my %nodes;

    open my $fh, '<', 'deps.tgf' || die "Can't open deps.tgf";

  node_parse: {
        while ( my $line = <$fh> ) {
            chomp $line;
            if ( $line eq '#' ) {
                last node_parse;
            }
            my ( $node, $label ) = split / /, $line;
            if ( exists $nodes{$node} ) {
                die "Redefinition of $node";
            }
            $nodes{$node} = { label => $label };
        }
    }
  edge_parse: {
        while ( my $line = <$fh> ) {
            chomp $line;
            if ( $line eq '#' ) {
                last node_parse;
            }
            my ( $src, $dest, $label ) = split / /, $line;
            if ( not exists $nodes{$src} ) {
                warn "Construcing dummy node $src";
                $nodes{$src} = { label => $src };
            }
            if ( not exists $nodes{$dest} ) {
                warn "Constructing dummy node $dest";
                $nodes{$dest} = { label => $dest };
            }
            push @{ $nodes{$src}->{outbound}->{$dest} ||= [] },
              { dest => $dest, label => $label };
            push @{ $nodes{$dest}->{inbound}->{$src} ||= [] },
              { src => $src, label => $label };
        }
    }
    return \%nodes;
}
