use strict;
use warnings;
use Data::Dumper;
use Data::Person;

#define perl modules
# use lib '/<path to perl modules>'

use Communication::Speak qw(test);

$| = 1;

sub main {

    # Speak::test();
    test();
    my @dogs = qw(retreiver labrador alsatian);

    print Dumper(@dogs);

}

sub call_person {
    my $person1 = new Data::Person( "Bob", 45 );
    $person1->greet("Mike");

    my $person2 = new Data::Person( "Mike", 55 );
    $person2->greet("Bob");
}

# main();

call_person();
