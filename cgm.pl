#! /usr/bin/perl

use strict ;
use warnings ;
use Text::CSV ;
use Template ;
use Data::Dumper;
use FindBin qw( $Bin );

use lib "$Bin" ;
use cgm ;

# On déclare les fichiers d'entrée et de sortie :
my $input_csv = "cgm_desc_20171215.csv" ;
my $input_tt = "cgm.tt" ;
my $output_xml = "cgm_20171215.xml" ;

# On charge le fichier d'entrée
open(my $fh, '<:encoding(UTF-8)', $input_csv)
    or die "Could not open file '$input_csv' $!";

my @column_names = qw( cote unittitle date date_normal langue support technique nb_feuillets dimensions reliure scopecontent provenance lien_bnr desc_lien_bnr auteur_personne auteur_collectivite ) ;
my $csv = Text::CSV->new ({ binary => 1, auto_diag => 1 });
$csv->column_names( @column_names );

my @levels ;

while ( my $row = $csv->getline_hr($fh) ) {    
    my $level = row2levels($row) ;
    print Dumper($level);
    push @levels, $level ;
}

my %var = ( levels => \@levels ) ;

my $tt = Template->new({ ENCODING => 'utf8' }) ;
$tt->process($input_tt, \%var, $output_xml) or die $tt->error() ;