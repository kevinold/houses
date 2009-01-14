package HousesDB::Houses;
use base qw/DBIx::Class/;

__PACKAGE__->load_components(qw/PK::Auto Core/);
__PACKAGE__->table('houses');
__PACKAGE__->add_columns(qw/ id mls address city zip bedrooms baths sqft price subdivision year_built acres /);
__PACKAGE__->set_primary_key('id');

1;
