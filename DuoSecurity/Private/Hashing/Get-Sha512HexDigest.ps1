function Get-Sha512HexDigest {
    Param($String)

    if ([string]::IsNullOrEmpty($String)) { $String = '' }
    $StringBuilder = New-Object System.Text.StringBuilder
    [System.Security.Cryptography.HashAlgorithm]::Create('SHA512').ComputeHash([System.Text.Encoding]::UTF8.GetBytes($String)) | ForEach-Object {
        [Void]$StringBuilder.Append($_.ToString('x2'))
    }
    $StringBuilder.ToString()
}