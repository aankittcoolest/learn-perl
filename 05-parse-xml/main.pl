use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;

$| = 1;

sub main {
    my %opts;

    getopts( "d:r", \%opts );

    if ( !checkusage( \%opts ) ) {
        usage();
        exit();
    }

    my $input_dir = $opts{"d"};

    my @files = get_files($input_dir);
    process_files( \@files, $input_dir );

}

sub process_files {
    my ( $files, $input_dir ) = @_;

    foreach my $file (@$files) {
        process_file( $file, $input_dir );
    }
}

sub process_file {
    my ( $file, $input_dir ) = @_;
    print "Processing $file in $input_dir ... \n";

    my $filepath = "$input_dir/$file";

    open( INPUTFILE, $filepath ) or die "Unable to open $filepath\n";
    $/ = "</entry>";

    my $count = 0;

    while ( my $chunk = <INPUTFILE> ) {

        # print "\n\n$count: $chunk";
        my ($band) = $chunk =~ m'<band>(.*?)</band>';

        unless ( defined($band) ) {
            next;
        }
        print "BAND: $band\n";

        my @albums = $chunk =~ m'<album>(.*?)</album>'sg;
        print "found " . scalar(@albums) . " for $band ...\n";

        print Dumper(@albums);
        $count++;
    }
    close(INPUTFILE);
}

sub get_files {
    my $input_dir = shift;
    unless ( opendir( INPUTDIR, $input_dir ) ) {
        die "unable to open directory: '$input_dir'\n";
    }

    my @files = readdir(INPUTDIR);
    closedir(INPUTDIR);

    @files = grep( /\.xml$/, @files );
    return @files;
}

sub checkusage {
    return 1;
}

sub usage () {
    print "Usage details goes here!";
}

main()
