/*
Dans un fichier texte de type colonne fixe,
remplacer une donnée à une position fixe
*/

$NewString = ""#chaine de remplacement
$old = "" #chaine dans laquelle effectuer le remplacement
$ColDeb = 1 #position de début de la chaine
$new = $old.remove($ColDeb, $NewString.Length).insert($ColDeb, $NewString)
