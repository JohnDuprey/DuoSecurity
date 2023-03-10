function Remove-DuoAccount {
    <#
    .SYNOPSIS
    Delete Account

    .DESCRIPTION
    Delete the account with ID account_id from the system.

    .PARAMETER AccountId
    ID of the customer account to delete as returned by Retrieve Accounts. This is a 20 character string, for example DA9VZOC5X63I2W72NRP9.

    .EXAMPLE
    Remove-DuoAccount -AccountId SOMEACCOUNTID

    .INPUTS
    PSCustomObject. Duo Accounts object

    .OUTPUTS
    PSCustomObject. Returns a Duo Response object.

    .LINK
    https://duo.com/docs/accountsapi#delete-account
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('account_id')]
        [string]$AccountId
    )

    process {
        $DuoRequest = @{
            Method = 'POST'
            Path   = '/accounts/v1/account/delete'
            Params = @{
                account_id = $AccountId
            }
        }

        if ($PSCmdlet.ShouldProcess($AccountId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
