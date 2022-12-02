function New-DuoAccount {
    <#
    .SYNOPSIS
    Creates Duo Account
    
    .DESCRIPTION
    Calls Accounts API to create a new account
    
    .PARAMETER Name
    Name of account
    
    .EXAMPLE
    New-DuoAccount -Name 'Some Company'
    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        $Name
    )
    $DuoRequest = @{
        Method = 'POST'
        Path   = '/accounts/v1/account/create'
        Params = @{
            name = $Name
        }
    }
    if ($PSCmdlet.ShouldProcess($Name)) {
        Invoke-DuoRequest @DuoRequest
    }
}
