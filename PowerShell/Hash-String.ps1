function Hash($textToHash)
{
    $hasher = new-object System.Security.Cryptography.SHA256Managed
    $toHash = [System.Text.Encoding]::UTF8.GetBytes($textToHash)
    $hashByteArray = $hasher.ComputeHash($toHash)
    foreach($byte in $hashByteArray)
    {
         $res += $byte.ToString()
    }
    return $res;
}

# source :
# https://blogs.msdn.microsoft.com/luc/2011/01/21/powershell-getting-the-hash-value-for-a-string/

# And its usage :
#   PS #> . Hash.ps1
#   PS #> Hash("hi")

# Instead of SHA256, you can use other hashing algorithms like the ones available by default in .NET 3.5 ou 4 :
#   System.Security.Cryptography.MD5
#   System.Security.Cryptography.RIPEMD160
#   System.Security.Cryptography.SHA1
#   System.Security.Cryptography.SHA256
#   System.Security.Cryptography.SHA384
#   System.Security.Cryptography.SHA512
