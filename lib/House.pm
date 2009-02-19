package House;

use Moose;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Config::Any::General;
use Data::Dumper;
use HousesDB;

#my $CFG = Config::Any::General->load( "$FindBin::Bin/../houses.conf" ) || die $!;
my $DB = undef;

has 'dsn' => ( is => 'ro', isa => 'Str', default => "dbi:SQLite:$FindBin::Bin/../houses.db");
has 'db'  => ( is => 'rw', isa => 'Object', default => undef );

sub BUILD {
    my $self = shift;
    $DB = HousesDB->connect( $self->dsn );
    $self->db($DB);
}

sub finalist {
    my $self = shift;

    my $house = $self->db->resultset('Houses')->search({ our_status => 'finalist', }, { order_by => 'rank' })->first;
    return $house->mls;
}

1;

__END__

has 'mls_id' => (
    is  => 'rw',
    isa => 'Str',
    required => 1,
);

