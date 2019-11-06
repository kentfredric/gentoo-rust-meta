use 5.006;    # our
use strict;
use warnings;

package CrateDB;

our $VERSION = '0.001000';

# ABSTRACT: Database of Crate information

# AUTHORITY

sub new {
    my $self = $_[1];
    $self = { @_[ 1 .. $#_ ] } if not ref $self;
    bless $self, __PACKAGE__;
    $self->__CHECK;
    $self;
}

sub __CHECK {
    defined $_[0]->{meta_root} or die "meta_root not specified";
}

sub file_paths_suffix {
    my ( $self, $suffix ) = @_;
    my (@out);
    my $base_path = $self->{meta_root} . '/' . $suffix;
    if ( -e "${base_path}.pl" ) {
        push @out, "${base_path}.pl";
    }
    if ( -e "${base_path}" and -d "${base_path}" ) {
        opendir my ($dfh), $base_path;
        while ( my $ent = readdir $dfh ) {
            next if $ent =~ /\A\.\.?\z/;
            if ( -e "${base_path}/${ent}" and -d "${base_path}/${ent}" ) {
                opendir my $subdfh, "${base_path}/${ent}";
                while ( my $subent = readdir $subdfh ) {
                    next if $subent =~ /\A\.\.?\z/;
                    next unless $subent =~ /\.pl\z/;
                    push @out, "${base_path}/${ent}/${subent}";
                }
            }
        }
    }
    return @out;
}

sub file_paths {
    my ($self) = @_;
    map { $self->file_paths_suffix($_) } 'a' .. 'z';
}

sub load_file {
    my ( $self, $path ) = @_;
    return unless -e $path;
    local $@;
    do "$path";
    die $@ if $@;
}

sub add {
    my ( $self, $name, $version, $meta ) = @_;
    $self->{crates}->{$name}->{$version} = CrateInfo->new(
        {
            name    => $name,
            version => $version,
            %{$meta}
        }
    );
}

sub crate_names {
    sort keys %{ $_[0]->{crates} };
}

sub crate_versions {
    my ( $self, $crate ) = @_;
    if ( not defined $crate ) {
        die "Illegal undef crate passed";
    }
    if ( not exists $self->{crates}->{$crate} ) {
        die "No crate named $crate";
    }
    sort keys %{ $self->{crates}->{$crate} };
}

sub crates {
    my ( $self, ) = @_;
    map {
        my $crate = $_;
        map { $self->{crates}->{$crate}->{$_} } $self->crate_versions($crate)
    } $self->crate_names;
}

BEGIN { *crate = *::crate }

1;

