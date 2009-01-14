#!/usr/bin/perl
use strict;
use warnings;

use YAML qw(LoadFile Dump);
=pod
my $config = { name => 'IVR',
             root => '/usr/local/IVR/root',
             authentication => {
                                user_class => 'IVR::M::Emp',
                                user_field => 'employeeid',
                                password_field => 'password',
                                role_class => 'IVR::M::Roles',
                                user_role_class => 'IVR::M::UserRoles',
                                user_role_user_field => 'user_id',
                                user_role_role_field => 'role_id',
                        },
             static => { dirs => [ 'css', 'i' ], debug => 1 },
 };

print Dump($config);
my $yaml = Dump($config);
=cut
my $yload = LoadFile('houses.yml');

use Data::Dumper;
print Dumper($yload);
