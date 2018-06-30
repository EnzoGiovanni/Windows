# Sorting a file by line Quickly
###############################################################
Clear-Host

##############################################################
$FileToSort = ""

##############################################################
$hs = new-object System.Collections.Generic.HashSet[string]

$reader = [System.IO.File]::OpenText($FileToSort)
try {Do {$t = $hs.Add($reader.ReadLine())} While (!($reader.EndOfStream))}
finally {$reader.Close()}

$ls = new-object system.collections.generic.List[string] $hs;
$ls.Sort();

try{$Writer = New-Object System.IO.StreamWriter ($File); foreach ($s in $ls) {$Writer.WriteLine($s)}}
finally {$Writer.Close()}
