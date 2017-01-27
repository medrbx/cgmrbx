#! /usr/bin/perl

use strict ;
use warnings ;
use Text::CSV ;
use Template ;
# use Data::Dumper ;

use cgm ;

# On déclare les fichiers d'entrée et de sortie :
my $input_csv = "cgm_desc.csv" ;
my $input_tt = "cgm.tt" ;
my $output_xml = "cgm.xml" ;


open(my $fh, '<', $input_csv)
    or die "Could not open file '$input_csv' $!";

my $csv = Text::CSV->new ({
    binary    => 1,
    auto_diag => 1
});

my @levels ;

while ( my $row = $csv->getline($fh) ) {
    my $level = row2levels($row) ;
    push @levels, $level ;
}

my %var = ( levels => \@levels ) ;

my $tt = Template->new() ;
$tt->process($input_tt, \%var, $output_xml) or die $tt->error() ;