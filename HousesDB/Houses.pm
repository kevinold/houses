package HousesDB::Houses;
use base qw/DBIx::Class/;

__PACKAGE__->load_components(qw/PK::Auto Core/);
__PACKAGE__->table('houses');
__PACKAGE__->add_columns(qw/ id mls address city zip bedrooms total_full_baths total_half_baths square_feet listing_price subdivision year_built acres /);
__PACKAGE__->set_primary_key('id');

1;