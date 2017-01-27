package cgm ;

use Exporter ;
@ISA = qw( Exporter ) ;
@EXPORT = qw( row2levels ) ;

use strict ;
use warnings ;

sub row2levels {
    my ($row) = @_ ;
    
    my ( $cote, $unittitle, $date, $date_normal, $langue, $support, $technique, $nb_feuillets, $dimensions, $reliure, $scopecontent, $provenance, $auteur_personne, $auteur_collectivite ) = @$row ;

    my $langmaterial ;
    if ( $langue ne '' ) {    
        $langmaterial = _langmaterial($langue) ;
    }

    my $ead_technique ;
    if ( $technique ne '' ) {    
        $ead_technique = _technique($technique) ;
    }
    
    my $persname ;
    if ( $auteur_personne ne '' ) {    
        $persname = _persname($auteur_personne) ;
    }

    my $corpname ;
    if ( $auteur_collectivite ne '' ) {    
        $corpname = _corpname($auteur_collectivite) ;
    }

    my %c = ( 
        cote => $cote,
        unittitle => $unittitle,
        date => $date,
        date_normal => $date_normal,
        unittitle => $unittitle,
        langmaterial => $langmaterial,
        support => $support,
        technique => $ead_technique,
        nb_feuillets => $nb_feuillets,
        dimensions => $dimensions,
        reliure => $reliure,
        scopecontent => $scopecontent,
        provenance => $provenance,
        persname => $persname,
        corpname => $corpname
    ) ;
    
    return \%c ;
}

sub _langmaterial {
    my ($langue) = @_ ;
    my @ead_lang ;
    my @langues = split /\$/, $langue ;
    foreach my $language (@langues) {
        my ( $language, $langcode ) = split /\|/, $language ;
        my %ead_lang = ( 
            language => $language,
            langcode => $langcode
        ) ;
        push @ead_lang, \%ead_lang ;
    }
    return \@ead_lang ;
}

sub _corpname {
    my ($corp) = @_ ;
    my @corps = split /\$/, $corp ;
    my @ead_corps ;
    foreach my $cp (@corps) {
        my ($corpname, $corpname_normal ) =  split /\|/, $cp ;
        my %corp = (
            corpname => $corpname,
            corpname_normal => $corpname_normal
        ) ;
        push @ead_corps, \%corp ;
    }
    return \@ead_corps ;
}

sub _persname {
    my ($pers) = @_ ;
    my @perss = split /\$/, $pers ;
    my @ead_pers ;
    foreach my $ps (@perss) {
        my ($persname, $persname_normal ) =  split /\|/, $pers ;
        my %pers = (
            persname => $persname,
            persname_normal => $persname_normal
        ) ;
        push @ead_pers, \%pers ;
    }
    return \@ead_pers ;
}

sub _technique {
    my ($tech) = @_ ;
    my @ead_tech = split /\$/, $tech ;
    return \@ead_tech ;
}

1 ;