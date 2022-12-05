function Remove-DuoToken {
    <#
    .SYNOPSIS
    Delete Hardware Token
    
    .DESCRIPTION
    Delete the hardware token with ID token_id from the system. Requires "Grant write resource" API permission.
    
    .PARAMETER TokenId
    Id of token
    
    .EXAMPLE
    Remove-DuoToken -TokenId SOMEDUOID

    .LINK
    https://duo.com/docs/adminapi#delete-hardware-token
    
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('token_id')]
        [string]$TokenId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/tokens/{0}' -f $TokenId
        }

        if ($PSCmdlet.ShouldProcess($TokenId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
