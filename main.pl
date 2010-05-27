use Utils;
my $limit1 = +{limit => 1};

for (1..10) {
    my $g = (Guest->search({name => "guest$_"}, $limit1))[0];
    unless ($g) {
        $g = Guest->new(name => "guest$_");
        $g->save;
    }
}

for (1..10) {
    my $s = (Site->search({name => "site$_"}, $limit1))[0];
    unless ($s) {
        $s = Site->new(name => "site$_");
        $s->save;
    }
}

for my $gid (1..10) {
    for my $sid (1..10) {
        my $cond = +{guest_id => $gid, site_id => $sid};
        my $g2s = (Guest2Site->search($cond, $limit1))[0];
        unless ($g2s) {
            $g2s = Guest2Site->new(%$cond);
            $g2s->save;
        }
    }
}

#child -> parent
my $g2s_s2 = Guest2Site->search({site_id => 2}, $limit1);
while (my $i = $g2s_s2->next) {
    my $g = $i->guest_obj;
    my $s = $i->site_obj;
    #p [$g->id, $s->id];
}

#parent -> child
my $g4 = Guest->lookup(4);
my $g4_p = $g4->guest2site_objs;
while (my $c = $g4_p->next) {
    #p $c->id;
}
