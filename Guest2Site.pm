package Guest2Site;
use base qw/Data::ObjectDriver::BaseObject/;
use Utils;

__PACKAGE__->install_properties({
        columns     => [qw/id guest_id site_id created_at updated_at/],
        datasource  => 'guest2site',
        primary_key => 'id',
        driver      => Driver->driver,
    });

__PACKAGE__->has_a(
    {class => "Guest", column => "guest_id"}
);

__PACKAGE__->has_a(
    {class => "Site", column => "site_id"}
);


1;
