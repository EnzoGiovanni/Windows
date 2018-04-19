$logLocation = "C:\logs\"

$gci = Get-ChildItem -Path $logLocation -Filter '*.log'

Foreach ($i in $gci)
{
    $reader = [System.IO.File]::OpenText($($i.FullName))

    while (!($reader.EndOfStream))
    {
        $line = $reader.ReadLine()
        # Perform action on each line of the log here
    }

    $reader.Close()
}

# Source :
# https://community.spiceworks.com/topic/962065-powershell-get-content-alternative

# voir Aussi "StreamReader Methods" :
# https://msdn.microsoft.com/en-us/library/system.io.streamreader_methods(v=vs.110).aspx
# 
# StreamReader Class :
# https://msdn.microsoft.com/en-us/library/system.io.streamreader(v=vs.110).aspx
