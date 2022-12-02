function Get-DuoAccountEdition {
    <#
    .SYNOPSIS
    Get Edition
    
    .DESCRIPTION
    Returns the edition for a child account.

    .PARAMETER AccountId
    The child customer account ID as returned by Retrieve Accounts. This is a 20 character string, for example DA9VZOC5X63I2W72NRP9.
    
    .EXAMPLE
    Get-DuoAccounts | Select-Object name,account_id, @{n='edition'; e={($_ | Get-DuoAccountEdition).edition}}

    .LINK
    https://duo.com/docs/accountsapi#get-edition
    
    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('account_id')]
        [string]$AccountId
    )

    process {
        Select-DuoAccount -AccountId $AccountId -Quiet
        
        $DuoRequest = @{
            Method = 'GET'
            Path   = '/admin/v1/billing/edition'
        }

        $Response = Invoke-DuoRequest @DuoRequest
        if ($Response.stat -eq 'OK') {
            $Response.response
        }
        else { 
            $Response
        }
    }
}
