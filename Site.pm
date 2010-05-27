package Site;
use base qw/Data::ObjectDriver::BaseObject/;
use Utils;

__PACKAGE__->install_properties({
        columns     => [qw/id name created_at updated_at/],
        datasource  => 'site',
        primary_key => 'id',
        driver      => Driver->driver,
    });

1;
