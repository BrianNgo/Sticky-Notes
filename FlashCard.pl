#! /usr/bin/perl -w
use strict;
use warnings;
use Tk;
use DateTime;

my $fileName = "inputFile.txt";
my $mw = MainWindow->new; # Create new main window
$mw->geometry("500x300+0+0"); # Position on the left corner
$mw->title(getDate());
my $textField = $mw->Text(-background => "yellow",
			  -font => "verdana 15")->pack; 
checkFile($fileName);

my $input = "";
$mw->bind("<Return>" => sub {$input = $textField->get("1.0", "end");}); 
MainLoop;

# Save the new strings to input file
if (!($input eq "")) {
    open(fileHandler,">", $fileName);
    print fileHandler $input;
}

# getDate function returns the current date 
sub getDate {
    my $dt = DateTime->now;
    my $date = $dt->ymd;
    return $date;
}

# checkFile function checks for the existence of input file
sub checkFile {
    my $file = $_[0];
    # Check for the saved input file
    if (-e $file) {    
	print "File Exists!\n";
	open(fileHandler, $file);
	while (my $input = <fileHandler>){
	    chomp($input);
	    $textField->insert("end", "$input\n");
	}
	close(fileHandler);	
    }
    else {
	print "File not exist!\n";
    }
}
