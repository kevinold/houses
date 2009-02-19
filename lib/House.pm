package House;

use Moose;
use FindBin;
use lib "$FindBin::Bin/../lib";
#use Config::Any::General;
use Data::Dumper;

use HousesDB;

#my $cfg = Config::Any::General->load( "$FindBin::Bin/../houses.conf" ) || die $!;
#my $schema = HousesDB->connect( $cfg->{ 'Model::DB' }->{ connect_info } );
my $dsn = "dbi:SQLite:$FindBin::Bin/../houses.db";
my $schema = HousesDB->connect( $dsn );


sub finalist {
    my ($self) = @_;

    my $house = $schema->resultset('Houses')->search({ our_status => 'finalist', }, { order_by => 'rank' })->first;
    return $house->mls;
}

1;

__END__

has 'mls_id' => (
    is  => 'rw',
    isa => 'Str',
    required => 1,
);

