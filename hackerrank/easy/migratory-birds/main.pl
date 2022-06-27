#!/usr/bin/perl

use strict;
use warnings;

#
# Complete the 'migratoryBirds' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY arr as parameter.
#

sub migratoryBirds {
    my $arr_ref = shift;

    my %abc = ();

    my $max_key = @$arr_ref[0];
    my $max_val = 1;
    $abc{$_} = defined( $abc{$_} ) ? $abc{$_} + 1 : 1 for (@$arr_ref);
    my @results = sort { $abc{$a} <=> $abc{$b} } reverse sort keys %abc;
    return $results[-1];
}

my @arr = qw (1 4 4 4 5 3 3 3);

my $result = migratoryBirds \@arr;
print $result;
