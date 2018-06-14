RegEx :
https://regex101.com/

Collections :
https://www.red-gate.com/simple-talk/sysadmin/powershell/powershell-one-liners-collections-hashtables-arrays-and-strings

Powershell: The many ways to read and write to files :
https://kevinmarquette.github.io/2017-03-18-Powershell-reading-and-saving-data-to-files/

FileInfo classe :
https://msdn.microsoft.com/fr-fr/library/system.io.fileinfo(v=vs.110).aspx

Traitement parallel
https://github.com/nightroman/SplitPipeline

MultiThreading
https://www.codeproject.com/Tips/895840/Multi-Threaded-PowerShell-Cookbook

Fichier et flux de données E/S :
https://docs.microsoft.com/fr-fr/dotnet/standard/io/index

variables environnements :
les lister : Dir env:\
les utiliser : $env:username

Converstions :
https://www.oreilly.com/library/view/windows-powershell-cookbook/9780596528492/ch06s07.html
convert a number into its hexadecimal representation :
Use the formatting operator : "{0:X4}" -f 1234
Use the [Convert] class : [Convert]::ToString(1234, 16)
 
Data Type :
https://ss64.com/ps/syntax-datatypes.html

 [string]    Fixed-length string of Unicode characters
 [char]      A Unicode 16-bit character
 [byte]      An 8-bit unsigned character

 [int]       32-bit signed integer
 [uint32]    32-bit UnSigned integer
 [long]      64-bit signed integer
 [bool]      Boolean True/False value

 [decimal]   A 128-bit decimal value
 [single]    Single-precision 32-bit floating point number
 [double]    Double-precision 64-bit floating point number
 [DateTime]  Date and Time

 [xml]       Xml object
 [array]     An array of values
 [hashtable] Hashtable object


Variables automatiques
Variable	Description
$$	          Dernier jeton de la ligne de commande précédente
$?	          État booléen de la dernière commande
$^	          Premier jeton de la ligne de commande précédente
$_	          Objet de pipeline actif
$Args	        Arguments passés à un script ou à une fonction
$Error	      Tableau d’erreurs de commandes précédentes
$Foreach	    Référence à l’énumérateur d’une boucle foreach
$Home	        Répertoire de base de l’utilisateur ; généralement défini sur %HOMEDRIVE%%HOMEPATH%
$Host	        Référence à l’application qui héberge le langage POWERSHELL
$Input	      Énumérateur des objets dirigés vers un script
$LastExitCode	Code de sortie du dernier programme ou script
$Matches	    Table de hachage des correspondances trouvées avec l’opérateur de correspondance –
$PSHome	      Emplacement d’installation de Windows PowerShell
$profile	    Profil standard (peut ne pas être présent)
$StackTrace	  Dernière exception interceptée par Windows PowerShell
$Switch	      Énumérateur d’une instruction switch
