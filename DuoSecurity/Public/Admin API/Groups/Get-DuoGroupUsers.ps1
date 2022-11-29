function Get-DuoGroupUsers {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('group_id')]
        [string]$GroupId
    )

    process { 
        $DuoRequest = @{
            Method = 'GET'
            Path   = '/admin/v2/groups/{0}/users' -f $GroupId 
            Params = @{ offset = 0 }
        }
        Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest
    }
}
