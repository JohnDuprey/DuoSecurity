function New-DuoToken {
    <#
    .SYNOPSIS
    Create Hardware Token
    
    .DESCRIPTION
    Create a new hardware token. Requires "Grant write resource" API permission.
    
    .PARAMETER Type	
    The type of hardware token to import. One of:

    Type	Description
    ----    -----------
    "t6"	TOTP-6 hardware token
    "t8"	TOTP-8 hardware token
    "h6"	HOTP-6 hardware token
    "h8"	HOTP-8 hardware token
    "yk"	YubiKey AES hardware token
    Duo-D100 tokens (type "d1") are imported when purchased from Duo and may not be created via the Admin API.
    
    .PARAMETER Serial
    The serial number of the token (maximum length 128 characters).
    
    .PARAMETER Secret
    The TOTP/HOTP secret. This parameter is required for TOTP-6, TOTP-8, HOTP-6 and HOTP-8 hardware tokens.
    
    .PARAMETER Counter
    Initial value for the HOTP counter. This parameter is only valid for TOTP-6, TOTP-8, HOTP-6 and HOTP-8 hardware tokens. Default: 0.
    
    .PARAMETER PrivateId
    The 12-character YubiKey private ID. This parameter is required for YubiKey hardware tokens.
    
    .PARAMETER AesKey
    The 32-character YubiKey AES key. This parameter is required for YubiKey hardware tokens.
    
    .EXAMPLE
    $Secret = New-DuoTokenTotpSecret
    New-DuoToken -Serial 001 -Type t6 -Secret $Secret.Hex

    .LINK
    https://duo.com/docs/adminapi#create-hardware-token

    .NOTES
    See New-DuoTokenTotpSecret for more info about generating TOTP secrets
    
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('h6', 'h8', 't6', 't8', 'yk', 'd1')]
        [string]$Type,

        [Parameter(Mandatory = $true)]
        [string]$Serial,

        [Parameter()]
        [string]$Secret,

        [Parameter()]
        [int]$Counter,

        [Parameter()]
        [string]$PrivateId,

        [Parameter()]
        [string]$AesKey
    )

    $Params = @{
        type   = $Type
        serial = $Serial
    }

    if ($Type -in @('h6', 'h8', 't6', 't8')) {
        if (!$Secret) {
            $Secret = Read-Host 'OTP secret' -MaskInput
        }
        $Params.secret = $Secret

        if ($Counter) {
            $Params.counter = $Counter
        }
    }
    elseif ($Type -eq 'yk') {
        if (!$PrivateId) {
            $PrivateId = Read-Host 'YubiKey Private ID' -MaskInput
        }
        if (!$AesKey) {
            $AesKey = Read-Host 'YubiKey AES Key' -MaskInput
        }

        $Params.private_id = $PrivateId
        $Params.aes_key = $AesKey
    }

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/tokens'
        Params = $Params
    }

    $Request = Invoke-DuoRequest @DuoRequest
    if ($Request.stat -ne 'OK') {
        $Request
    }
    else {
        $Request.response
    }
}
