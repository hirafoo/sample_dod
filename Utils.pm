package Utils;
use base qw/Exporter/;
use strict;
use warnings;
use Data::Dumper;
use Driver;
use Guest;
use Site;
use Guest2Site;

our @EXPORT = qw/p say/;

sub import {
    strict->import;
    warnings->import;

    Driver->import;
    Guest->import;
    Site->import;
    Guest2Site->import;

    __PACKAGE__->export_to_level(1, @_);
}

sub p {
    local $Data::Dumper::Indent = 1;
    local $Data::Dumper::Terse  = 1;

    warn Dumper @_;
    my @c = caller;
    print STDERR "  at $c[1]:$c[2]\n\n"
}

sub say {print @_, "\n"}

1;
