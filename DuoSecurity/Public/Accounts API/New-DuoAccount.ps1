function New-DuoAccount {
    <#
    .SYNOPSIS
    Create Account

    .DESCRIPTION
    Create a new child account.

    .PARAMETER Name
    Name for the new customer.

    .EXAMPLE
    New-DuoAccount -Name 'Some Company'

    .INPUTS
    None

    .OUTPUTS
    PSCustomObject. Returns a Duo Response object.

    .LINK
    https://duo.com/docs/accountsapi#create-account
    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Name
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
