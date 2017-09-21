#Lister les fichiers d'un répertoire

$Rep = "chemin du repertoire"

#Liste les fichiers avec tous les attributs
Get-ChildItem -LiteralPath $Rep -Force | where {$_.Attributes -ne 'Directory'}

#Liste le nom des fichiers (mettre FullName pour le chemin complet)
Get-ChildItem -LiteralPath $Rep -Force | where {($_.Attributes -ne 'Directory') -and ($_.Name -like '*xxxx*')} | Select-Object -Property Name

#autre exemple
Get-ChildItem -LiteralPath $Rep -Force | where {($_.Attributes -ne 'Directory') -and ($_.Name -like '*.PRET')} | Select-Object -Property name, PSIsContainer

<#

 => get-member -MemberType Properties

   TypeName: System.IO.FileInfo

Name              MemberType     Definition                                                     
----              ----------     ----------                                                     
Mode              CodeProperty   System.String Mode{get=Mode;}                                  
PSChildName       NoteProperty   System.String PSChildName=HFLFF01M.HFLAF01M.AGENCBQE.BAN_DA....
PSDrive           NoteProperty   System.Management.Automation.PSDriveInfo PSDrive=D             
PSIsContainer     NoteProperty   System.Boolean PSIsContainer=False                             
PSParentPath      NoteProperty   System.String PSParentPath=Microsoft.PowerShell.Core\FileSys...
PSPath            NoteProperty   System.String PSPath=Microsoft.PowerShell.Core\FileSystem::D...
PSProvider        NoteProperty   System.Management.Automation.ProviderInfo PSProvider=Microso...
Attributes        Property       System.IO.FileAttributes Attributes {get;set;}                 
CreationTime      Property       System.DateTime CreationTime {get;set;}                        
CreationTimeUtc   Property       System.DateTime CreationTimeUtc {get;set;}                     
Directory         Property       System.IO.DirectoryInfo Directory {get;}                       
DirectoryName     Property       System.String DirectoryName {get;}                             
Exists            Property       System.Boolean Exists {get;}                                   
Extension         Property       System.String Extension {get;}                                 
FullName          Property       System.String FullName {get;}                                  
IsReadOnly        Property       System.Boolean IsReadOnly {get;set;}                           
LastAccessTime    Property       System.DateTime LastAccessTime {get;set;}                      
LastAccessTimeUtc Property       System.DateTime LastAccessTimeUtc {get;set;}                   
LastWriteTime     Property       System.DateTime LastWriteTime {get;set;}                       
LastWriteTimeUtc  Property       System.DateTime LastWriteTimeUtc {get;set;}                    
Length            Property       System.Int64 Length {get;}                                     
Name              Property       System.String Name {get;}                                      
BaseName          ScriptProperty System.Object BaseName {get=if ($this.Extension.Length -gt 0...
VersionInfo       ScriptProperty System.Object VersionInfo {get=[System.Diagnostics.FileVersi...
#>
