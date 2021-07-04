use strict;
use warnings;
use Data::Dumper;

$| = 1;

sub main {
    my $input = "data.csv";

    unless ( open( INPUT, $input ) ) {
        die "\nCannot open $input\n";
    }

    <INPUT>;

    my @data;
  LINE: while ( my $line = <INPUT> ) {

        # $line =~ s/^\s*|\s*$//g;
        $line =~ s/^\s*//;
        $line =~ s/\s*$//;

        $line =~ /S+/ or next;

        chomp $line;

        my @values = split /\s*,\s*/, $line;

        if ( scalar(@values) < 3 ) {
            print "Invalid line: $line\n";
            next;
        }

        foreach my $value (@values) {
            if ( $value eq '' ) {
                print "Invalid line: $line\n";
                next LINE;
            }
        }

        my ( $name, $payment, $date ) = split /\s*,\s*/, $line;

        my %values = (
            "Name"    => $name,
            "Payment" => $payment,
            "Date"    => $date
        );

        push @data, \%values;
    }

    close INPUT;

    foreach my $data (@data) {
        print $data->{"Name"} . "\n";

        # print Dumper($data);
    }

}

main()
