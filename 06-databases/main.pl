use strict;
use warnings;
use local::lib;
use Data::Dumper;
use Getopt::Std;
use XML::Simple;
use DBI;

$| = 1;

sub main {
    my %opts;

    getopts( "d:ei", \%opts );

    if ( !checkusage( \%opts ) ) {
        usage();
        exit();
    }

    my $input_dir = $opts{"d"};

    my @files = get_files($input_dir);
    my @data  = process_files( \@files, $input_dir );

    # import to DB
    if ( $opts{"i"} ) {
        add_to_database( \@data );
    }

    # export from DB
    if ( $opts{"e"} ) {
        export_from_database();
    }

}

sub export_from_database {

    my $output_file = "output.txt";

    open OUTPUT, '>' . $output_file
      or die "Cannot create output file $output_file. \n";

    my $hostname = "db";
    my $dbh = DBI->connect( "dbi:mysql:bands;host=$hostname;", "root", "root" );

    my $sql =
"SELECT b.id as band_id, b.name as band_name, a.id as album_id, a.name as album_name, a.position as position FROM bands b JOIN albums a on a.band_id = b.id";
    my $sth = $dbh->prepare($sql);

    unless ( defined($sth) ) {
        die "Unable to prepare export query. \n";
    }

    unless ( defined( $sth->execute() ) ) {
        die "Unable to execute export query. \n";
    }

    while ( my $row = $sth->fetchrow_hashref() ) {
        my $band_id    = $row->{"band_id"};
        my $band_name  = $row->{"band_name"};
        my $album_id   = $row->{"album_id"};
        my $album_name = $row->{"album_name"};
        my $position   = $row->{"position"};

        print OUTPUT
          "$band_id, $band_name, $album_id, $album_name, $position. \n";

    }

    $sth->finish();
    $dbh->disconnect();

    close OUTPUT;

    print "Completed. \n";

}

sub add_to_database {
    my $data     = shift;
    my $hostname = "db";
    my $dbh = DBI->connect( "dbi:mysql:bands;host=$hostname;", "root", "root" );

    unless ( defined($dbh) ) {
        die "Cannot connect to database.\n";
    }

    print "Connected\n";

    my $sth_bands  = $dbh->prepare('INSERT INTO bands (name) values (?)');
    my $sth_albums = $dbh->prepare(
        'INSERT INTO albums (name,position,band_id) values (?, ?, ?)');

    unless ($sth_bands) {
        die "Error preparing SQL \n";
    }

    $dbh->do("delete from albums") or die "Can't clean albums table.\n";
    $dbh->do("delete from bands")  or die "Can't clean bands table.\n";

    foreach my $data (@$data) {
        my $band_name = $data->{"name"};
        my $albums    = $data->{"albums"};

        print "Inserting $band_name into database...\n";
        $sth_bands->execute($band_name);
        my $band_id = $sth_bands->{"mysql_insertid"};

        foreach my $album (@$albums) {
            my $album_name     = $album->{"album_name"}->[0];
            my $album_position = $album->{"position"}->[0];

            unless (
                $sth_albums->execute( $album_name, $album_position, $band_id ) )
            {
                die "Unable to execute albums insert. \n";
            }
        }

    }

    $sth_bands->finish();
    $sth_albums->finish();

    $dbh->disconnect();

    print "Completed. \n";

}

sub process_files {
    my ( $files, $input_dir ) = @_;

    my @data;

    foreach my $file (@$files) {
        push @data, process_file( $file, $input_dir );
    }

    return @data;
}

sub process_file {
    my ( $file, $input_dir ) = @_;
    print "Processing $file in $input_dir ... \n";

    my $filepath = "$input_dir/$file";

    open( INPUTFILE, $filepath ) or die "Unable to open $filepath\n";
    undef $/;

    my $content = <INPUTFILE>;

    close(INPUTFILE);
    my $parser = new XML::Simple;

    my $dom = $parser->XMLin( $content, ForceArray => 1 );

    my @output;

    foreach my $band ( @{ $dom->{"entry"} } ) {
        my $band_name = $band->{"band"}->[0];
        my $albums    = $band->{"album"};

        my @albums;

        foreach my $album (@$albums) {
            my $album_name    = $album->{"name"};
            my $chartposition = $album->{"chartposition"};

            push @albums,
              {
                "album_name" => $album_name,
                "position"   => $chartposition,
              };
        }

        push @output,
          {
            "name"   => $band_name,
            "albums" => \@albums
          };

    }

    return @output;
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

