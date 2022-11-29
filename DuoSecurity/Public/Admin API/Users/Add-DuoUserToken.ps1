function Add-DuoUserToken {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId,

        [Parameter(Mandatory = $true)]
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
