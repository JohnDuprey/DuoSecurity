function New-DuoTokenTotpSecret {
    <#
    .SYNOPSIS
    Creates TOTP secret in Duo format
    
    .DESCRIPTION
    Creates both Base32 and Hex formatted secret keys for Duo token and TOTP app
    
    .PARAMETER SecretLength
    Length of secret
    
    .EXAMPLE
    New-DuoTokenTotpSecret

    Base32                   Hex
    ------                   ---
    EMFJSRYQRRWYXX6ME5T3DYZH 230a9947108c6d8bdfcc2767b1e327
    
    #>
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
