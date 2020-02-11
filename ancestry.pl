#!perl
use strict;
use warnings;

use Data::Dump qw(pp);
our %roots = (
    libc                       => 1,
    syn                        => 1,
    'proc-macro2'              => 1,
    quote                      => 1,
    'rustc-std-workspace-core' => 1,
    serde                      => 1,
    serde_derive               => 1,
    'unicode-xid'              => 1,
);
our $MAX_DEPTH = ( exists $ENV{MAX_DEPTH} ) ? ( $ENV{MAX_DEPTH} + 0 ) : 5;

my $graph = load_graph();
my $root = select_root( $graph, $ARGV[0], $ARGV[1] );

print_deep_parents( $root, undef, [ deep_parents( $graph, $root ) ] );
our $seen_cache;
our $seen_stack;
our $deep_print;

sub print_deep_parents {
    my ( $node, $reason, $nodes ) = @_;
    my $prefix = do {
        if ( ( $deep_print || 0 ) >= 1 ) {
            ( q[ ] x ( ( $deep_print || 0 ) * 2 ) ) . q[-];
        }
        else {
            q[];
        }
    };
    print "$prefix $node";
    if ( defined $reason ) {
        print " ";
        $reason =~ s/weak://;
        print "($reason)";
    }
    print "\n";
    local $deep_print = ( $deep_print || 0 ) + 1;
    $prefix = do {
        if ( ( $deep_print || 0 ) >= 1 ) {
            ( q[ ] x ( ( $deep_print || 0 ) * 2 ) ) . q[-];
        }
        else {
            q[];
        }
    };

    for my $node ( @{$nodes} ) {
      my $label = defined $node->{label} ? " $node->{label}" : "";
        if ( $node->{root} ) {
            print "$prefix \e[1;32m(^)\e[0m $node->{src}$label\n";
            next;
        }
        if ( $node->{circular} ) {
            print
              "$prefix \e[1;33m(~)\e[0m $node->{src}$label\n";
            next;
        }
        if ( $node->{multiple} ) {
            print
              "$prefix \e[1;33m(*)\e[0m $node->{src}$label\n";
              next;
        }
        if ( $node->{too_deep} ) {
            print "$prefix \e[1;31m(<)\e[0m $node->{src}$label\n";
            next;
        }
        print_deep_parents( $node->{src}, $node->{label}, $node->{parents} );
    }

}

sub deep_parents {
    my ( $graph, $node ) = @_;
    local $seen_stack = [ @{ $seen_stack || [] } ];
    if ( grep { $_ eq $node } @{$seen_stack} ) {

        # warn "Already seen $node";
        return;
    }
    my ( $crate, $version ) = split q[//], $node;

    if ( exists $roots{$crate} ) {
        return;
    }
    if ( $MAX_DEPTH + 1 < @{$seen_stack} ) {
      return;
    }
    push @{$seen_stack}, $node;

    my @out;
    my @parents = parents( $graph, $node );

    return unless @parents;
    for my $parent (@parents) {
        my (@xparents) = deep_parents( $graph, $parent->{src} );
        if (@xparents) {
            my (@dxparents);
            for my $xparent (@xparents) {
                my %extra;
                my ( $p_crate, $p_version ) = split q[//], $xparent->{src};
                if ( exists $roots{$p_crate} ) {
                    $extra{root} = 1;
                } 
                if ( grep { $_ eq $xparent->{src} } @{$seen_stack} ) {
                    $extra{circular} = 1;
                }
               if ( $MAX_DEPTH < @{$seen_stack} ) {
                  $extra{too_deep} = 1;
                }
                #if ( not exists $seen_cache->{ $xparent->{src} } ) {
                #  $seen_cache->{$xparent->{src}} = 1;
                #} else {
                  # $extra{multiple} = 1;
                  #}
                #$seen_cache->{ $xparent->{src} } = scalar @{$seen_stack};
                push @dxparents, { %{$xparent}, %extra };
            }
            push @out, { %{$parent}, parents => \@dxparents };
        }
        else {
            push @out, { %{$parent} };
        }
    }
    #pp $seen_cache;
    #$seen_cache->{$node} = scalar @{$seen_stack};
  
    return @out;
}

sub parents {
    my ( $graph, $node ) = @_;
    if ( not exists $graph->{$node} ) {
        die "$node not found in graph";
    }
    my $gnode = $graph->{$node};
    my @out;
    for my $dest ( sort keys %{ $gnode->{inbound} || {} } ) {
        my (%labels);
        for my $link ( @{$gnode->{inbound}->{$dest} || [] } ) {
          if ( not defined $link->{label} ) {
            $labels{required} = 1;
          } else {
            $labels{$link->{label}} = 1;  
          }
        }
        my $out_label;
        if ( 1 == keys %labels and exists $labels{required} ) {
          $out_label = undef;
        } else {
          my %features;
          my %kinds;
          for my $label ( keys %labels ) {
            next unless $label =~ /\Aweak:feature:(.*)\z/;
            $features{$1} = 1;
            $kinds{features} = 1;
          }
          for my $label ( keys %labels ) {
            next unless $label =~ /\Aweak:optional\z/;
            next if keys %features;
            my ( $p_name, $p_version ) = split q[//], $node;
            $features{$p_name} = 1;
            $kinds{features} = 1;
          }
          for my $label ( keys %labels ) {
            next unless $label =~ /\Aweak:test\z/;
            $kinds{test} = 1;
            last;
          }
          for my $label ( keys %labels ) {
            next unless $label =~ /\Arequired\z/;
            $kinds{required} = 1;
            last;
          }
          my (@label_parts);
          if ( $kinds{required} ) {
            push @label_parts, 'required';
          }
          if ( $kinds{test} ) {
            push @label_parts, 'test',
          }
          if ( $kinds{features} ) {
            push @label_parts, 'features: ' . join q[, ], sort keys %features;
          }

          $out_label = join q[, ], @label_parts;
        }
        push @out, { src => $dest, label => $out_label };
    }
    if ( not @out ) {

        # warn "No parents for $node\n";
    }
    return @out;
}

sub select_root {
    my ( $graph, $name, $version ) = @_;
    if ( not defined $name ) {
        die "crate name missing";
    }
    my (@v_candidates) = grep /\A\Q$name\E\/\//, keys %{$graph};
    if ( not @v_candidates ) {
        die "no such crate named $name";
    }
    if ( not defined $version ) {
        return $v_candidates[0] if @v_candidates == 1;
        die "Too many versions of $name, pick one: @{v_candidates}";
    }
    my (@v_exact) = grep { $_ eq "$name//$version" } @v_candidates;
    return $v_exact[0] if @v_exact == 1;
    die "No such crate version $name//$version" if @v_exact == 0;
    die "Too many nodes with $name//$version";
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
