function Get-DuoTokens {
    <#
    .SYNOPSIS
    Retrieve Hardware Tokens

    .DESCRIPTION
    Returns a single hardware token or a paged list of OTP hardware tokens. If no type and serial parameters are provided, the list will contain all hardware tokens. Otherwise, the list will contain either a single hardware token (if a match was found) or no hardware tokens. Requires "Grant read resource" API permission.

    .PARAMETER TokenId
    Id of token

    .PARAMETER Type
    Specify a type and serial number to look up a single hardware token. One of:

    Type	Description
    "t6"    TOTP-6 hardware token
    "t8"    TOTP-8 hardware token
    "h6"	HOTP-6 hardware token
    "h8"	HOTP-8 hardware token
    "yk"	YubiKey AES hardware token
    "d1"	Duo-D100 hardware token
    * This option is required if serial is present.

    .PARAMETER Serial
    The serial number of the hardware token.
    * This option is required if type is present.

    .EXAMPLE
    Get-DuoTokens

    .LINK
    https://duo.com/docs/adminapi#retrieve-hardware-tokens

    .LINK
    https://duo.com/docs/adminapi#retrieve-hardware-token-by-id

    #>
    [CmdletBinding(DefaultParameterSetName = 'List')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Single')]
        [Alias('token_id')]
        [string]$TokenId,

        [Parameter(ParameterSetName = 'List')]
        [ValidateSet('h6', 'h8', 't6', 't8', 'yk', 'd1')]
        [string]$Type,

        [Parameter(ParameterSetName = 'List')]
        [string]$Serial
    )

    process {
        switch ($PSCmdlet.ParameterSetName) {
            'Single' {
                $Path = '/admin/v1/tokens/{0}' -f $TokenId
            }
            'List' {
                $Path = '/admin/v1/tokens'
            }
        }

        $Params = @{}
        if ($Type) { $Params.type = $Type }
        if ($Serial) { $Params.serial = $Serial }

        $DuoRequest = @{
            Method = 'GET'
            Path   = $Path
            Params = $Params
        }

        switch ($PSCmdlet.ParameterSetName) {
            'Single' {
                $Request = Invoke-DuoRequest @DuoRequest
                if ($Request.stat -ne 'OK') {
                    $Request
                } else {
                    $Request.response
                }
            }
            default {
                Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest
            }
        }
    }
}

Set-Alias -Name Get-DuoToken -Value Get-DuoTokens
