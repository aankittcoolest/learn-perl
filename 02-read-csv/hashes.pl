use strict;
use warnings;

use Data::Dumper;
$| = 1;

sub main {

    # defining hash
    my %months = (
        "Jan" => 1,
        "Dec" => 12,
        "Feb" => 2,
        "Jun" => 6,
        "Mar" => 3,
        "Apr" => 4,
        "May" => 5,
    );

    print $months{"Dec"} . "\n";

    my %days = (
        1 => "Monday",
        2 => "Tuesday",
        3 => "Wednesday",
        4 => "Thursday",
    );

    print $days{1} . "\n";

    my @months = keys %months;

    for my $month (@months) {
        my $value = $months{$month};

        print "$month: $value\n";
    }

    while ( my ( $key, $value ) = each %days ) {
        print "$key: $value\n";
    }

}

sub iteration {
    my %foods = (
        "mice"  => "milk",
        "dogs"  => "meat",
        "birds" => "seeds"
    );

    while ( my ( $key, $value ) = each %foods ) {
        print "$key: $value\n";
    }

    my @animals = sort keys(%foods);

    print Dumper(@animals);

    foreach my $key (@animals) {
        my $value = $foods{$key};

        print "$key = $value\n";
    }
}

sub array_of_hashes {
    my %hash1 = (
        "cat"   => "meat",
        "birds" => "seeds",
        "fish"  => "worms"
    );

    my @test;

    push @test, \%hash1;

    print $test[0]{"birds"} . "\n";

}

# main()
# iteration()
array_of_hashes()
