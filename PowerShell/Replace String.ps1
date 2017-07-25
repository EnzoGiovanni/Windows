/*
Dans un fichier texte de type colonne fixe,
remplacer une donnée à une position fixe
*/

$NewString = ""#chaine de remplacement
$old = "" #chaine dans laquelle effectuer le remplacement
$ColDeb = 1 #position de début
$ColFin = 1 #position de fin
$new = $old.remove($ColDeb,$ColFin).insert($ColDeb,$NewString)
