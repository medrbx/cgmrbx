package cgm ;

use Exporter ;
@ISA = qw( Exporter ) ;
@EXPORT = qw( row2levels ) ;

use strict ;
use warnings ;

sub row2levels {
    my ($row) = @_ ;

    if ( $row->{'langue'} ne '' ) {    
        $row->{'langmaterial'} = _langmaterial($row->{'langue'}) ;
    }

    if ( $row->{'auteur_personne'} ne '' ) {    
        $row->{'persname'} = _persname($row->{'auteur_personne'}) ;
    }

    if ( $row->{'auteur_collectivite'} ne '' ) {    
        $row->{'corpname'} = _corpname($row->{'auteur_collectivite'}) ;
    }
    

    my %c = (
        cote => $row->{'cote'},
        unittitle => $row->{'unittitle'},
        date => $row->{'date'},
        date_normal => $row->{'date_normal'},
        support => $row->{'support'},
        technique => $row->{'technique'},
        extent => $row->{'nb_feuillets'},
        dimensions => $row->{'dimensions'},
        reliure => $row->{'reliure'},
        langmaterial => $row->{'langmaterial'},
        scopecontent => $row->{'scopecontent'},
        provenance => $row->{'provenance'},
        persname => $row->{'persname'},
        corpname => $row->{'corpname'},
        dao => $row->{'lien_bnr'},
        daodesc => $row->{'desc_lien_bnr'}
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
        my ($persname, $persname_normal ) =  split /\|/, $ps ;
        my %pers = (
            persname => $persname,
            persname_normal => $persname_normal
        ) ;
        push @ead_pers, \%pers ;
    }
    return \@ead_pers ;
}

1 ;
