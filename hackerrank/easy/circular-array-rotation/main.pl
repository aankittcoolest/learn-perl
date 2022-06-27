#!/usr/bin/perl

use strict;
use warnings;

#
# Complete the 'circularArrayRotation' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. INTEGER_ARRAY a
#  2. INTEGER k
#  3. INTEGER_ARRAY queries
#

sub circularArrayRotation {
    my ( $arr_ref, $rounds, $query_arr_ref ) = @_;
    for ( 1 .. $rounds ) {
        unshift @$arr_ref, pop @$arr_ref;

    }
    return @$arr_ref[@$query_arr_ref];

}

# open(my $fptr, '>', $ENV{'OUTPUT_PATH'});

# my @first_multiple_input = split /\s+/, rtrim(my $first_multiple_input_temp = <STDIN>);

# my $n = $first_multiple_input[0];

# my $k = $first_multiple_input[1];

# my $q = $first_multiple_input[2];

# my $a = rtrim(my $a_temp = <STDIN>);

# my @a = split /\s+/, $a;

# my @queries = ();

# for (1..$q) {
#     my $queries_item = ltrim(rtrim(my $queries_item_temp = <STDIN>));
#     push @queries, $queries_item;
# }

my @a       = ( 1, 2, 3 );
my $k       = 2;
my @queries = ( 0, 1, 2 );

my @result = circularArrayRotation \@a, $k, \@queries;

# print $fptr join "\n", @result;
# print $fptr "\n";

# close $fptr;

# sub ltrim {
#     my $str = shift;

#     $str =~ s/^\s+//;

#     return $str;
# }

# sub rtrim {
#     my $str = shift;

#     $str =~ s/\s+$//;

#     return $str;
# }
