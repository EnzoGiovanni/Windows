# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-5.1#examples

$REP = ""

$Exts = Get-ChildItem -Force -Recurse -LiteralPath $Rep | where {($_.Attributes -ne 'Directory')} | Select-Object -Property Extension | Sort-Object -Property Extension -Unique

<#

 Select-Object -Property name

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
