# Conversion csv vers ead pour intégration manuscrits dans le CGM

## Remarques sur le fichier dgm_desc.csv

### Encodage
Être vigilant lors de l'enregistrement du fichier à bien choisir l'UTF-8

### Champs
- cote : obligatoire, non répétable,
- titre : obligatoire, non répétable,
- date : obligatoire, non répétable
- date_normalisee : obligatoire, non répétable. *Voir si on utilise la même normalisation que pour la bn-r*.
- langue : non obligatoire, répétable.
On entre la langue d'abord en langage naturel, puis de manière codifiée. On sépare les deux par un pipe, sans espace. Par exemple "français|fre".
On peut indiquer deux langues différentes, qu'on sépare alors par un caractère dollar. Par exemple, "français|fre$latin|lat".
- support : non obligatoire, non répétable.
- technique : non obligatoire, répétable.
On peut indiquer deux techniques différentes, qu'on sépare alors par un caractère dollar. Par exemple, "manuscrit$dactylographie".
- nb_feuillets : non obligatoire, non répétable.
- dimensions : non obligatoire, non répétable.
- reliure : non obligatoire, non répétable.
- note_contenu : non obligatoire, non répétable.
- provenance : non obligatoire, non répétable.
- auteur : non obligatoire, répétable.
On entre l'auteur  d'abord en langage naturel, puis de manière cnormalisée. On sépare les deux par un pipe, sans espace. Par exemple "Charles Barenne|Barenne, Charles".
- auteur_coll : pas obligatoire, répétable.
Idem que pour auteur.
