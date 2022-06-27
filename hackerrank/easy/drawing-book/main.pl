#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw(min);

#
# Complete the 'pageCount' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER n
#  2. INTEGER p
#

sub pageCount {

    # Write your code here
    my ( $total, $page ) = @_;

    return min( int( $page / 2 ),
        int( ( ( $total % 2 > 0 ? $total : $total + 1 ) - $page ) / 2 ) );

}

# open(my $fptr, '>', $ENV{'OUTPUT_PATH'});

# my $n = ltrim(rtrim(my $n_temp = <STDIN>));

# my $p = ltrim(rtrim(my $p_temp = <STDIN>));

# my $n = 6;
# my $p = 2;

my $n = 5;
my $p = 4;

my $result = pageCount $n, $p;

# print $fptr "$result\n";

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
