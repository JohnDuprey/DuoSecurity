function Get-DuoAccounts {
    <#
    .SYNOPSIS
    Retrieve Accounts
    
    .DESCRIPTION
    Returns a list of child accounts.
    
    .EXAMPLE
    Get-DuoAccounts

    .LINK
    https://duo.com/docs/accountsapi#retrieve-accounts
    
    #>
    [CmdletBinding()]
    Param()

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/accounts/v1/account/list'
    }
    $Response = Invoke-DuoRequest @DuoRequest
    if ($Response.stat -eq 'OK') {
        $script:DuoAccountsList = $Response.response
        $Response.response
    }
    else { 
        $Response
    }
}
