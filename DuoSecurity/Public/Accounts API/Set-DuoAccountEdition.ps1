function Set-DuoAccountEdition {
    <#
    .SYNOPSIS
    Set Edition

    .DESCRIPTION
    Sets the edition for a child account.

    .PARAMETER AccountId
    The child customer account ID as returned by Retrieve Accounts. This is a 20 character string, for example DA9VZOC5X63I2W72NRP9.

    .PARAMETER Edition
    The edition to set. This should be one of:
    ENTERPRISE
    PLATFORM
    BEYOND

    .EXAMPLE
    Set-DuoAccountEdition -AccountId SOMEACCOUNTID -Edition 'BEYOND'

    .LINK
    https://duo.com/docs/accountsapi#set-edition

    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('account_id')]
        [string]$AccountId,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [ValidateSet('ENTERPRISE', 'PLATFORM', 'BEYOND')]
        [string]$Edition
    )

    process {
        Select-DuoAccount -AccountId $AccountId -Quiet

        $DuoRequest = @{
            Method = 'GET'
            Path   = '/admin/v1/billing/edition'
            Params = @{ edition = $Edition }
        }

        if ($PSCmdlet.ShouldProcess($AccountId)) {
            $Response = Invoke-DuoRequest @DuoRequest
            if ($Response.stat -eq 'OK') {
                $Response.response
            } else {
                $Response
            }
        }
    }
}
