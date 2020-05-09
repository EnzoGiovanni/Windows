###################################################################################################################
# Making a Black list domain for UnBound
###################################################################################################################
# Initialise PowerShell
Rv * -Scope Global -Force -Ea SilentlyContinue; rmo *; $error.Clear(); Cls
get-date
Write-Host ' '

###################################################################################################################
$FileOUT = "C:\Program Files\Unbound\BlackListDomain.conf"
$TMP = "$env:USERPROFILE\Downloads\temp.conf"

###################################################################################################################
#If(Test-Path $FileOUT) {Remove-Item $FileOUT}
If(Test-Path $TMP) {Remove-Item $TMP}

###################################################################################################################
# liste principale des domaines à BlackLister
$BLD = new-object System.Collections.Generic.HashSet[string]


###################################################################################################################
#Declaration de variables et paramétrages
[STRING]$Elt = ""; [BOOL]$Result = $false
$Domaines = new-object System.Collections.Generic.HashSet[string]
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Write-Host 'traitement en cours :'
Write-Host ' '


$ValidUrl = '(?:[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?\.)+[a-z0-9][a-z0-9-]{0,61}[a-z0-9]'



###################################################################################################################
$Url = "https://1hos.cf/"
###################################################################################################################
Write-Host '   - ' $Url
#lecture web
$writer = New-Object System.IO.StreamWriter($TMP); $writer.Write((Invoke-WebRequest -Uri $url).content); $Writer.Close()
# Lecture de la liste
$reader = New-Object System.IO.StreamReader($TMP)
Do {$Elt = $reader.ReadLine()
    If ($Elt -Match '^0.0.0.0 ' + $ValidUrl)   {   $Result = $Domaines.Add($Elt.Substring(7).Trim())  }
} While (!($reader.EndOfStream)); $reader.Close()
If(Test-Path $TMP) {Remove-Item $TMP}
# Intégration de la liste à la liste principale
$BLD.UnionWith($Domaines); $Domaines.Clear()
###################################################################################################################

###################################################################################################################
$Url = "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/hosts.txt"
###################################################################################################################
Write-Host '   - ' $Url
#lecture web
$writer = New-Object System.IO.StreamWriter($TMP); $writer.Write((Invoke-WebRequest -Uri $url).content); $Writer.Close()
# Lecture de la liste
$reader = New-Object System.IO.StreamReader($TMP)
Do {$Elt = $reader.ReadLine()
    If ($Elt -Match '^0.0.0.0 ' + $ValidUrl)   {   $Result = $Domaines.Add($Elt.Substring(7).Trim())  }
} While (!($reader.EndOfStream)); $reader.Close()
If(Test-Path $TMP) {Remove-Item $TMP}
# Intégration de la liste à la liste principale
$BLD.UnionWith($Domaines); $Domaines.Clear()
###################################################################################################################

###################################################################################################################
$Url = "https://raw.githubusercontent.com/mhxion/pornaway/master/hosts/porn_ads.txt"
###################################################################################################################
Write-Host '   - ' $Url
#lecture web
$writer = New-Object System.IO.StreamWriter($TMP); $writer.Write((Invoke-WebRequest -Uri $url).content); $Writer.Close()
# Lecture de la liste
$reader = New-Object System.IO.StreamReader($TMP)
Do {$Elt = $reader.ReadLine()
    If ($Elt -Match '^127.0.0.1       ' + $ValidUrl)   {   $Result = $Domaines.Add($Elt.Substring(15).Trim())  }
} While (!($reader.EndOfStream)); $reader.Close()
If(Test-Path $TMP) {Remove-Item $TMP}
# Intégration de la liste à la liste principale
$BLD.UnionWith($Domaines);
$Domaines.Clear()
###################################################################################################################

###################################################################################################################
$Url = "https://raw.githubusercontent.com/mhxion/pornaway/master/hosts/porn_sites.txt"
###################################################################################################################
Write-Host '   - ' $Url
#lecture web
$writer = New-Object System.IO.StreamWriter($TMP); $writer.Write((Invoke-WebRequest -Uri $url).content); $Writer.Close()
# Lecture de la liste
$reader = New-Object System.IO.StreamReader($TMP)
Do {$Elt = $reader.ReadLine()
    If ($Elt -Match '^127.0.0.1       ' + $ValidUrl)   {   $Result = $Domaines.Add($Elt.Substring(15).Trim())  }
} While (!($reader.EndOfStream)); $reader.Close()
If(Test-Path $TMP) {Remove-Item $TMP}
# Intégration de la liste à la liste principale
$BLD.UnionWith($Domaines);
$Domaines.Clear()
###################################################################################################################

###################################################################################################################
$Url = "https://raw.githubusercontent.com/chadmayfield/my-pihole-blocklists/master/lists/pi_blocklist_porn_all.list"
###################################################################################################################
Write-Host '   - ' $Url
#lecture web
$writer = New-Object System.IO.StreamWriter($TMP); $writer.Write((Invoke-WebRequest -Uri $url).content); $Writer.Close()
# Lecture de la liste
$reader = New-Object System.IO.StreamReader($TMP)
Do {$Elt = $reader.ReadLine()
    If ($Elt -Match $ValidUrl)   {   $Result = $Domaines.Add($Elt.Trim())  }
} While (!($reader.EndOfStream)); $reader.Close()
If(Test-Path $TMP) {Remove-Item $TMP}
# Intégration de la liste à la liste principale
$BLD.UnionWith($Domaines);
$Domaines.Clear()
###################################################################################################################

###################################################################################################################
$Url = "https://raw.githubusercontent.com/austinheap/sophos-xg-block-lists/master/easylist.txt"
###################################################################################################################
Write-Host '   - ' $Url
#lecture web
$writer = New-Object System.IO.StreamWriter($TMP); $writer.Write((Invoke-WebRequest -Uri $url).content); $Writer.Close()
# Lecture de la liste
$reader = New-Object System.IO.StreamReader($TMP)
Do {$Elt = $reader.ReadLine()
    If ($Elt -Match $ValidUrl)   {   $Result = $Domaines.Add($Elt.Trim())  }
} While (!($reader.EndOfStream)); $reader.Close()
If(Test-Path $TMP) {Remove-Item $TMP}
# Intégration de la liste à la liste principale
$BLD.UnionWith($Domaines);
$Domaines.Clear()
###################################################################################################################

###################################################################################################################
$Url = "https://v.firebog.net/hosts/AdguardDNS.txt"
###################################################################################################################
Write-Host '   - ' $Url
#lecture web
$writer = New-Object System.IO.StreamWriter($TMP); $writer.Write((Invoke-WebRequest -Uri $url).content); $Writer.Close()
# Lecture de la liste
$reader = New-Object System.IO.StreamReader($TMP)
Do {$Elt = $reader.ReadLine()
    If ($Elt -Match $ValidUrl)   {   $Result = $Domaines.Add($Elt.Trim())  }
} While (!($reader.EndOfStream)); $reader.Close()
If(Test-Path $TMP) {Remove-Item $TMP}
# Intégration de la liste à la liste principale
$BLD.UnionWith($Domaines);
$Domaines.Clear()
###################################################################################################################

###################################################################################################################
$Url = "https://raw.githubusercontent.com/deathbybandaid/piholeparser/master/Subscribable-Lists/ParsedBlacklists/EasyList-Liste-FR.txt"
###################################################################################################################
Write-Host '   - ' $Url
#lecture web
$writer = New-Object System.IO.StreamWriter($TMP); $writer.Write((Invoke-WebRequest -Uri $url).content); $Writer.Close()
# Lecture de la liste
$reader = New-Object System.IO.StreamReader($TMP)
Do {$Elt = $reader.ReadLine()
    If ($Elt -Match $ValidUrl)   {   $Result = $Domaines.Add($Elt.Trim())  }
} While (!($reader.EndOfStream)); $reader.Close()
If(Test-Path $TMP) {Remove-Item $TMP}
# Intégration de la liste à la liste principale
$BLD.UnionWith($Domaines);
$Domaines.Clear()
###################################################################################################################

###################################################################################################################
$Url = "https://raw.githubusercontent.com/austinheap/sophos-xg-block-lists/master/coinblocker.txt"
###################################################################################################################
Write-Host '   - ' $Url
#lecture web
$writer = New-Object System.IO.StreamWriter($TMP); $writer.Write((Invoke-WebRequest -Uri $url).content); $Writer.Close()
# Lecture de la liste
$reader = New-Object System.IO.StreamReader($TMP)
Do {$Elt = $reader.ReadLine()
    If ($Elt -Match $ValidUrl)   {   $Result = $Domaines.Add($Elt.Trim())  }
} While (!($reader.EndOfStream)); $reader.Close()
If(Test-Path $TMP) {Remove-Item $TMP}
# Intégration de la liste à la liste principale
$BLD.UnionWith($Domaines);
$Domaines.Clear()
###################################################################################################################

###################################################################################################################
$Url = "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts;showintro=0"
###################################################################################################################
Write-Host '   - ' $Url
#lecture web
$writer = New-Object System.IO.StreamWriter($TMP); $writer.Write((Invoke-WebRequest -Uri $url).content); $Writer.Close()
# Lecture de la liste
$reader = New-Object System.IO.StreamReader($TMP)
Do {$Elt = $reader.ReadLine()
    If ($Elt -Match '^127.0.0.1' + $ValidUrl)   {   $Result = $Domaines.Add($Elt.Substring(9).Trim())  }
} While (!($reader.EndOfStream)); $reader.Close()
If(Test-Path $TMP) {Remove-Item $TMP}
# Intégration de la liste à la liste principale
$BLD.UnionWith($Domaines); $Domaines.Clear()
###################################################################################################################

###################################################################################################################
$Url = "https://raw.githubusercontent.com/badmojr/1Hosts/master/Pro/hosts.txt"
###################################################################################################################
Write-Host '   - ' $Url
#lecture web
$writer = New-Object System.IO.StreamWriter($TMP); $writer.Write((Invoke-WebRequest -Uri $url).content); $Writer.Close()
# Lecture de la liste
$reader = New-Object System.IO.StreamReader($TMP)
Do {$Elt = $reader.ReadLine()
    If ($Elt -Match '^0.0.0.0 ' + $ValidUrl)   {   $Result = $Domaines.Add($Elt.Substring(7).Trim())  }
} While (!($reader.EndOfStream)); $reader.Close()
If(Test-Path $TMP) {Remove-Item $TMP}
# Intégration de la liste à la liste principale
$BLD.UnionWith($Domaines); $Domaines.Clear()
###################################################################################################################

###################################################################################################################
$Url = "https://raw.githubusercontent.com/mkb2091/blockconvert/master/output/hosts.txt"
###################################################################################################################
Write-Host '   - ' $Url
#lecture web
$writer = New-Object System.IO.StreamWriter($TMP); $writer.Write((Invoke-WebRequest -Uri $url).content); $Writer.Close()
# Lecture de la liste
$reader = New-Object System.IO.StreamReader($TMP)
Do {$Elt = $reader.ReadLine()
    If ($Elt -Match '^0.0.0.0 ' + $ValidUrl)   {   $Result = $Domaines.Add($Elt.Substring(7).Trim())  }
} While (!($reader.EndOfStream)); $reader.Close()
If(Test-Path $TMP) {Remove-Item $TMP}
# Intégration de la liste à la liste principale
$BLD.UnionWith($Domaines); $Domaines.Clear()
###################################################################################################################

###################################################################################################################
$Url = "https://any.andryou.com/oisdhosts.txt"
###################################################################################################################
Write-Host '   - ' $Url
#lecture web
$writer = New-Object System.IO.StreamWriter($TMP); $writer.Write((Invoke-WebRequest -Uri $url).content); $Writer.Close()
# Lecture de la liste
$reader = New-Object System.IO.StreamReader($TMP)
Do {$Elt = $reader.ReadLine()
    If ($Elt -Match '^0.0.0.0 ' + $ValidUrl)   {   $Result = $Domaines.Add($Elt.Substring(7).Trim())  }
} While (!($reader.EndOfStream)); $reader.Close()
If(Test-Path $TMP) {Remove-Item $TMP}
# Intégration de la liste à la liste principale
$BLD.UnionWith($Domaines); $Domaines.Clear()
###################################################################################################################

###################################################################################################################
$Url = "https://pastebin.com/raw/UP3s7pEB"
###################################################################################################################
Write-Host '   - ' $Url
#lecture web
$writer = New-Object System.IO.StreamWriter($TMP); $writer.Write((Invoke-WebRequest -Uri $url).content); $Writer.Close()
# Lecture de la liste
$reader = New-Object System.IO.StreamReader($TMP)
Do {$Elt = $reader.ReadLine()
    If ($Elt -Match '^127.0.0.1 ' + $ValidUrl)   {   $Result = $Domaines.Add($Elt.Substring(9).Trim())  }
} While (!($reader.EndOfStream)); $reader.Close()
If(Test-Path $TMP) {Remove-Item $TMP}
# Intégration de la liste à la liste principale
$BLD.UnionWith($Domaines); $Domaines.Clear()
###################################################################################################################

###################################################################################################################
# ajout de domain à la black liste
###################################################################################################################
Write-Host ' '
Write-Host ' '
Write-Host 'ajout black list'
Write-Host ' '
Write-Host ' '
$Result = $BLD.Add('mmoscience.com')
$Result = $BLD.Add('www.mmoscience.com')
$Result = $BLD.Add('primexbt.com')
$Result = $BLD.Add('ultycurveylips.info')
$Result = $BLD.Add('jakelakers.com')
$Result = $BLD.Add('nextyourcontent.com')
$Result = $BLD.Add('mikijjingl.com')
$Result = $BLD.Add('diveringecondsw.info')
$Result = $BLD.Add('cyberprotection.pro')
$Result = $BLD.Add('seriorladded.info')

###################################################################################################################
# retirer la White liste à la black liste
###################################################################################################################
# Chargement de la White liste
Write-Host ' '
Write-Host ' '
Write-Host 'retrait white list'
Write-Host ' '
Write-Host ' '
$WhtLst = new-object System.Collections.Generic.HashSet[string]
$reader = New-Object System.IO.StreamReader("$env:USERPROFILE\Synchro NAS\IT\PowerShell\WhiteList.dns")
Do {$Result = $WhtLst.Add($reader.ReadLine())} While (!($reader.EndOfStream))
$reader.Close()
$BLD.ExceptWith($WhtLst)


###################################################################################################################
# Ordonner la Black liste
###################################################################################################################
$BldEnum = new-object system.collections.generic.List[string] $BLD
$BldEnum.sort()
Write-Host ' '
Write-Host ' '
$BLD.count

###################################################################################################################
# Transférer la black liste dans un fichier
###################################################################################################################
If(Test-Path $FileOUT) {Remove-Item $FileOUT}
$writer = New-Object System.IO.StreamWriter($FileOUT)
ForEach ($Domain In $BldEnum) {$writer.WriteLine('local-zone: "' + $Domain + '" always_nxdomain')}
$Writer.Close()


###################################################################################################################
# Convert To Unix File Format
###################################################################################################################
Write-Host ' '
Write-Host ' '
Write-Host 'Convert To Unix File Format'
Write-Host ' '
Write-Host ' '
Gci $FileOUT | %{
  $contents = [IO.File]::ReadAllText($_) -replace "`r`n?", "`n"
  $utf8 = New-Object System.Text.UTF8Encoding $false
  [IO.File]::WriteAllText($_, $contents, $utf8)
}


###################################################################################################################
# redemarrer le service UnBound
###################################################################################################################
Write-Host ""
Write-Warning 'Redémare le service UnBound'
Get-Service -name unbound | Restart-Service
Start-Sleep -s 15
Get-Service -name unbound
#================================================================
Clear-DnsClientCache


###################################################################################################################
# Initialise PowerShell
###################################################################################################################
#Rv * -Scope Global -Force -Ea SilentlyContinue; rmo *; $error.Clear(); Cls
get-date
