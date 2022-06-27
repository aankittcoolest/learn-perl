#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw/sum/;

#
# Complete the 'bonAppetit' function below.
#
# The function accepts following parameters:
#  1. INTEGER_ARRAY bill
#  2. INTEGER k
#  3. INTEGER b
#

sub bonAppetit {

    # Write your code here
    my ( $bill_ref, $index_item_not_eaten, $bill_amount ) = @_;
    my $result =
      $bill_amount -
      ( sum(@$bill_ref) / 2 - @$bill_ref[$index_item_not_eaten] / 2 );
    print $result > 0 ? $result : "Bon Appetit";

}

# my @first_multiple_input = split /\s+/, rtrim(my $first_multiple_input_temp = <STDIN>);

# my $n = $first_multiple_input[0];

# my $k = $first_multiple_input[1];

# my $bill = rtrim(my $bill_temp = <STDIN>);

# my @bill = split /\s+/, $bill;

# my $b = ltrim(rtrim(my $b_temp = <STDIN>));

# my @bill = ( 3, 10, 2, 9 );
# my $k    = 1;
# my $b    = 12;

my @bill = ( 3, 10, 2, 9 );
my $k    = 1;
my $b    = 7;

bonAppetit \@bill, $k, $b;

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
