use strict;
use warnings;

use Data::Dumper;

$| = 1;

sub main {
    my $input = 'data.csv';

    unless ( open( INPUT, $input ) ) {
        die "\n cannot open $input\n";
    }

    # while (<INPUT>) {
    #     print $_;
    # }

    # ignore the first line
    <INPUT>;

    while ( my $line = <INPUT> ) {
        chomp($line);
        my @values = split( ',', $line );
        print $values[0] . "\n";
        print join( '|', @values );
    }
    close INPUT;

}

sub abc {
    my $input = 'data.csv';

    unless ( open( INPUT, $input ) ) {
        die "\n cannot open $input\n";
    }

    # ignore the first line
    <INPUT>;

    while ( my $line = <INPUT> ) {
        chomp($line);
        my @values = split( /\s*,\s*/, $line );
        print Dumper(@values);
    }
    close INPUT;

}

sub arrays {
    my $input = 'data.csv';

    unless ( open( INPUT, $input ) ) {
        die "\n cannot open $input\n";
    }

    # ignore the first line
    <INPUT>;

    my @lines;
    my $count = 0;

    while ( my $line = <INPUT> ) {
        chomp($line);
        my @values = split( /\s*,\s*/, $line );

        push @lines, $line;
    }
    close INPUT;

    foreach my $line (@lines) {
        print $line . "\n";
    }

}

sub arrays_of_arrays {
    my $input = 'data.csv';

    unless ( open( INPUT, $input ) ) {
        die "\n cannot open $input\n";
    }

    # ignore the first line
    <INPUT>;

    my @lines;
    my $count = 0;

    while ( my $line = <INPUT> ) {
        chomp($line);
        my @values = split( /\s*,\s*/, $line );

        push @lines, \@values;
    }
    close INPUT;

    print $lines[0][0] . "\n";

    foreach my $line (@lines) {
        print Dumper($line);
        print "Name: " . $line->[0] . "\n";

    }

}

sub test {
    my @animals = ( 'dog',   'cat',    'rabbit' );
    my @fruits  = ( 'apple', 'banana', 'orange' );
    my @values;

    # array referencing
    push @values, \@animals;
    push @values, \@fruits;
    print Dumper(@values);
}

# main()
# abc()
# arrays()
arrays_of_arrays()

  # test()
