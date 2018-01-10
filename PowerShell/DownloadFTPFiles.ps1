#FTP Server Information - SET VARIABLES
    $ftp = "ftp://XXX.com/" 
    $user = 'UserName' 
    $pass = 'Password'
    $folder = 'FTP_Folder'
    $target = "C:\Folder\Folder1\"

    #SET CREDENTIALS
    $credentials = new-object System.Net.NetworkCredential($user, $pass)

    function Get-FtpDir ($url,$credentials) {
        $request = [Net.WebRequest]::Create($url)
        $request.Method = [System.Net.WebRequestMethods+FTP]::ListDirectory
        if ($credentials) { $request.Credentials = $credentials }
        $response = $request.GetResponse()
        $reader = New-Object IO.StreamReader $response.GetResponseStream() 
        while(-not $reader.EndOfStream) {
            $reader.ReadLine()
        }
        #$reader.ReadToEnd()
        $reader.Close()
        $response.Close()
    }

    #SET FOLDER PATH
    $folderPath= $ftp + "/" + $folder + "/"

    $files = Get-FTPDir -url $folderPath -credentials $credentials

    $files 

    $webclient = New-Object System.Net.WebClient 
    $webclient.Credentials = New-Object System.Net.NetworkCredential($user,$pass) 
    $counter = 0
    foreach ($file in ($files | where {$_ -like "*.txt"})){
        $source=$folderPath + $file  
        $destination = $target + $file 
        $webclient.DownloadFile($source, $target+$file)

        #PRINT FILE NAME AND COUNTER
        $counter++
        $counter
        $source
    }
