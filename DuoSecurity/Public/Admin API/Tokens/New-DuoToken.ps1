function New-DuoToken {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('h6', 'h8', 't6', 't8', 'yk', 'd1')]
        [string]$Type,

        [Parameter(Mandatory = $true)]
        [string]$Serial,

        [string]$Secret,

        [int]$Counter,

        [string]$PrivateId,

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
