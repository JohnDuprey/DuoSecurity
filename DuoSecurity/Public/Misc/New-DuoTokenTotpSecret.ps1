function New-DuoTokenTotpSecret {
    [CmdletBinding()]
    Param(
        [int]$SecretLength = 15
    )

    # Base32 character set
    $Base32Charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'

    # Generate random byte string for secret
    $SecretBytes = [byte[]]::new($SecretLength)
    [Security.Cryptography.RNGCryptoServiceProvider]::new().GetBytes($SecretBytes, 0, $SecretLength)

    # Convert byte array to hexidecimal
    $Hex = ($SecretBytes | ForEach-Object ToString X2) -join ''

    # Convert byte array to binary
    $SecretBytesBinary = -join $SecretBytes.ForEach{
        [Convert]::ToString($_, 2).PadLeft(8, '0')
    }
    # Convert binary bytes to base32
    $Base32Secret = [regex]::Replace($SecretBytesBinary, '.{5}', {
            param($Match)
            $Base32Charset[[Convert]::ToInt32($Match.Value, 2)]
        })

    [PSCustomObject]@{
        Base32 = $Base32Secret
        Hex    = $Hex.ToLower()
    }
}
