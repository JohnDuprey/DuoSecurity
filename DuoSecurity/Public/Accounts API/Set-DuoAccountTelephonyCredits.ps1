function Get-DuoAccountEdition {
    <#
    .SYNOPSIS
    Set Telephony Credits
    
    .DESCRIPTION
    Sets the telephony credits for a child account.

    .PARAMETER AccountId
    The child customer account ID as returned by Retrieve Accounts. This is a 20 character string, for example DA9VZOC5X63I2W72NRP9.

    .PARAMETER Edition
    The total number of credits that the child account will have after transferring credits from the parent account.
    
    .EXAMPLE
    Set-DuoAccountTelephonyCredits -AccountId SOMEACCOUNTID -Credits

    .LINK
    https://duo.com/docs/accountsapi#set-telephony-credits
    
    .NOTES
    Any additional credits added to the child account are transferred from the parent account. For example, if the child account has 100 credits and it is then set to 300 credits, then 200 credits are deducted from the parent's balance and added to the child's balance.

    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('account_id')]
        [string]$AccountId,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [int]$Credits
    )

    process {
        Select-DuoAccount -AccountId $AccountId -Quiet
        
        $DuoRequest = @{
            Method     = 'GET'
            Path       = '/admin/v1/billing/edition'
            Parameters = @{ credits = $Credits }
        }

        if ($PSCmdlet.ShouldProcess($AccountId)) {
            $Response = Invoke-DuoRequest @DuoRequest
            if ($Response.stat -eq 'OK') {
                $Response.response
            }
            else { 
                $Response
            }
        }
    }
}
