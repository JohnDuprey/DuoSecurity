function Remove-DuoUserToken {
    <#
    .SYNOPSIS
    Disassociate Hardware Token from User
    
    .DESCRIPTION
    Disassociate a hardware token from the user with ID user_id. This method will return 200 if the hardware token was found or if no such hardware token exists. Requires "Grant write resource" API permission.
    
    .PARAMETER UserId
    The ID of the User
    
    .PARAMETER TokenId
    The ID of the Token
    
    .EXAMPLE
    Remove-DuoUserToken -UserId SOMEUSERID -TokenId SOMETOKENID
    
    .NOTES
    General notes
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId,
        
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('token_id')]
        [string]$TokenId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/users/{0}/tokens/{1}' -f $UserId, $TokenId
        }

        if ($PSCmdlet.ShouldProcess($TokenId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}