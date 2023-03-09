function Get-DuoAccountID {
    <#
    .SYNOPSIS
    Get Account ID # from Duo API hostname

    .DESCRIPTION
    Converts hexidecimal hostname to decimal format

    .PARAMETER ApiHost
    API hostname to get Account ID # for

    .EXAMPLE
    Get-DuoAccountID -ApiHost api-01ab23cd.duosecurity.com

    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias('api_hostname')]
        [string]$ApiHost
    )
    $AccountHex = ''

    if (!$ApiHost) {
        if ($script:DuoApiHost) { $ApiHost = $script:DuoApiHost }
        elseif ($script:DuoAccountsApiHost) { $ApiHost = $script:DuoAccountsApiHost }
    }

    if (!$ApiHost) {
        $ApiHost = Read-Host 'Please enter an API hostname (e.g. api-01ab23cd.duosecurity.com)'
    }

    if ($ApiHost -match 'api-(?<AccountHex>.+)\.duosecurity\.com') {
        $AccountHex = '0x{0}' -f $Matches.AccountHex
        $AccountHexUnsigned = [uint]$AccountHex
        ($AccountHexUnsigned.ToString().PadLeft(10, '0') -split '([0-9]{4})' -ne '') -join '-'
    }

    else {
        Write-Output 'Unable to determine account ID'
    }
}
