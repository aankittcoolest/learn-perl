#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw(max);

# Complete the flatlandSpaceStations function below.
sub flatlandSpaceStations {
    my ( $cities_count, $stations_ref ) = @_;

    my @a                  = sort { $a <=> $b } @$stations_ref;
    my $start_max_distance = $a[0] - 0;
    my $end_max_distance   = $cities_count - 1 - $a[$#a];

    my @b;

    print "@a\n";
    for ( my $i = 0 ; $i < $#a ; $i++ ) {
        push @b, int( ( $a[ $i + 1 ] - $a[$i] + 1 ) / 2 );
    }

    return max( $start_max_distance, @b, $end_max_distance );

}

# open(my $fptr, '>', $ENV{'OUTPUT_PATH'});

# my $nm = <>;
# $nm =~ s/\s+$//;
# my @nm = split /\s+/, $nm;

# my $n = $nm[0];
# $n =~ s/\s+$//;

# my $m = $nm[1];
# $m =~ s/\s+$//;

# my $c = <>;
# $c =~ s/\s+$//;
# my @c = split /\s+/, $c;

my $n = 100;
my @c = (
    93, 41, 91, 61, 30, 6,  25, 90, 97, 69, 66, 78, 37, 67, 46, 59, 18, 42,
    47, 43, 23, 50, 2,  57, 95, 3,  29, 81, 22, 10, 52, 31, 35, 94, 80, 5,
    60, 58, 64, 8,  48, 62, 7,  45, 63, 40, 21, 92, 0,  17, 98, 1,  68, 85,
    99, 24, 4,  34, 20, 26, 72, 51, 75, 27, 54, 86, 33, 28, 87, 56, 82, 83,
    19, 44, 15, 9,  84, 89, 14, 49, 12, 38, 79, 96, 88, 13, 16, 71, 77, 73
);

my $result = flatlandSpaceStations $n, \@c;
print $result;

# print $fptr "$result\n";

# close $fptr;
