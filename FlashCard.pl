#! /usr/bin/perl -w
use strict;
use warnings;
use Tk;

my $filename = "inputFile.txt";

if (-e $filename) { # Check whether the file exist
    my $mw = MainWindow->new; # Create new main window
    $mw->geometry("500x300+0+0"); # Position on the left corner
    print "File Exists!\n";
    open(fileHandler, $filename);
    while (my $input = <fileHandler>){
	chomp($input);
	print "$input\n";
	$mw->Label(-text => $input)->pack;
    }
    close(fileHandler);
    $mw->Button(-text => "Quit", -command => sub{ exit})->pack;
    MainLoop;
    #open(fileHandler, '>>', $filename);
    #my $consoleInput = <STDIN>;
    #print fileHandler $consoleInput;
    #close(fileHandler);
}
else {
    print "File not exist!\n";
}
