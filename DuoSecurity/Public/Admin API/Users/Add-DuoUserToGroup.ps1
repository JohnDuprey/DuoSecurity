function Add-DuoUserToGroup {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId,

        [Parameter(Mandatory=$true)]
        [string]$GroupId
    )

    process { 
        $DuoRequest = @{
            Method = 'POST'
            Path   = '/admin/v1/users/{0}/groups' -f $UserId
            Params = @{
                group_id = $GroupId
            }    
        }
        Invoke-DuoRequest @DuoRequest
    }
}
