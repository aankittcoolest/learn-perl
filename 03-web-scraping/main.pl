use strict;
use warnings;

use LWP::Simple;
use Mozilla::CA;

$| = 1;

sub main {

    my $content = get("https://www.caveofprogramming.com");

    unless ( defined($content) ) {
        die("unreachable url \n");
    }

    if ( $content =~ m'<h3>Spring Framework / Java / (.*) / C++ </h3>'i ) {
        my $title = $1;
        print("We have a course for $title lovers\n");

    }
    else {
        print "\nNo more Perl!\n";
    }

}

sub repeated_matching {
    my $content = get("https://www.caveofprogramming.com");

    unless ( defined($content) ) {
        die("unreachable url \n");
    }

    while ( $content =~ m|<a\s+[^>]*href\s*=\s*['"]([^>"']+)['"]|sig ) {
        print "$1\n";
    }

}

sub repeated_matching_all_at_once {
    my $content = get("https://www.caveofprogramming.com");

    unless ( defined($content) ) {
        die("unreachable url \n");
    }

    my @classes = $content =~ m|class="([^"']*?)"|ig;

    if ( @classes == 0 ) {
        print "No matches\n";
    }
    else {
        foreach my $class (@classes) {
            print "$class\n";
        }
    }

}

# main()
# repeated_matching()
repeated_matching_all_at_once()
