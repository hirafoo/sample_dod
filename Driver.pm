package Driver;
use base qw/Data::ObjectDriver::Driver::DBI/;
use strict;
use warnings;
use Data::Dumper;

sub p {
    local $Data::Dumper::Indent = 1;
    local $Data::Dumper::Terse  = 1;

    warn Dumper @_;
    my @c = caller;
    print STDERR "  at $c[1]:$c[2]\n\n"
}

sub driver {
    my $class = shift;

    $class->new(
        dsn      => 'dbi:mysql:sample_dod',
        username => 'root',
        password => '',
    )
}

#trace
sub prepare_statement {
    my $driver = shift;

    my $stmt = $driver->SUPER::prepare_statement(@_);
    if (1 or $ENV{DOD_TRACE}) {
        warn $stmt->as_sql;
        p $stmt->{bind};
    }
    $stmt;
}
1;
