function Get-DuoAccounts {
    <#
    .SYNOPSIS
    Retrieve Accounts

    .DESCRIPTION
    Returns a list of child accounts.

    .EXAMPLE
    Get-DuoAccounts

    .INPUTS
    None

    .OUTPUTS
    PSCustomObject. Returns a Duo Response object.

    .LINK
    https://duo.com/docs/accountsapi#retrieve-accounts

    #>
    [CmdletBinding()]
    Param(
        [switch]$IncludeEdition
    )

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/accounts/v1/account/list'
    }
    $Response = Invoke-DuoRequest @DuoRequest
    if ($Response.stat -eq 'OK') {

        if ($IncludeEdition.IsPresent) {
            $Accounts = $Response.response | Select-Object *, @{n = 'account_id_num'; e = { $_ | Get-DuoAccountID } }, @{ n = 'edition'; e = { ($_ | Get-DuoAccountEdition).edition } }
        }

        else {
            $Accounts = $Response.response | Select-Object *, @{n = 'account_id_num'; e = { $_ | Get-DuoAccountID } }
        }
        $script:DuoAccountsList = $Accounts
        $Accounts
    } else {
        $Response
    }
}
