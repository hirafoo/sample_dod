use Utils;

my $st = Data::ObjectDriver::SQL->new;
$st->from(["guest2site"]);
$st->add_where(guest_id => 2);
$st->add_select("sum(site_id)" => "sitesum");
$st->group({column => "guest_id"});

my $r = Guest2Site->driver->select_one($st->as_sql, $st->{bind});
p [$st->as_sql, $st->{bind}, $r];



#part 2
$st = Data::ObjectDriver::SQL->new;
$st->from(['guest2site']);
$st->group({column => 'guest_id'});

$st->add_select('guest_id');
$st->add_select('SUM(site_id)' => "sid");

$st->add_where(id => {op => "<", value => 36});

my $dbh = Guest2Site->driver->r_handle;
my $sth = $dbh->prepare($st->as_sql);
$sth->execute(@{ $st->{bind} });
my $v = $sth->fetchall_arrayref;
p [$st->as_sql, $st->{bind}, $v];
