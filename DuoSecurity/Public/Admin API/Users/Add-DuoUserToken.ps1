function Add-DuoUserToken {
    <#
    .SYNOPSIS
    Associate Hardware Token with User
    
    .DESCRIPTION
    Associate a hardware token with the user with ID user_id. Requires "Grant write resource" API permission.

    Object limits: 100 tokens per user.
    
    .PARAMETER UserId
    The ID of the user
    
    .PARAMETER TokenId
    The ID of the hardware token to associate with the user.
    
    .EXAMPLE
    Add-DuoUserToken -UserId SOMEUSERID -TokenId SOMETOKENID
    
    .NOTES
    General notes
    #>
    [CmdletBinding()]
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
            Method = 'POST'
            Path   = '/admin/v1/users/{0}/tokens' -f $UserId
            Params = @{
                token_id = $TokenId
            }    
        }
        Invoke-DuoRequest @DuoRequest
    }
}
