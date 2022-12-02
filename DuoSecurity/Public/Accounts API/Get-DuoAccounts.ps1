function Get-DuoAccounts {
    <#
    .SYNOPSIS
    List Duo child accounts
    
    .DESCRIPTION
    Calls the Accounts API to retrieve Duo Accounts under parent
    
    .EXAMPLE
    Get-DuoAccounts
    
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
