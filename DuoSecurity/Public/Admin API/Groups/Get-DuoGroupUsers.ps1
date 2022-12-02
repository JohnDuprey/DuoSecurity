function Get-DuoGroupUsers {
    <#
    .SYNOPSIS
    Retrieve Group Members
    
    .DESCRIPTION
    Returns a paged list of members of a specified group.
    
    .PARAMETER GroupId
    Group Id to get member list for
    
    .EXAMPLE
    Get-DuoGroupUsers -GroupId SOMEDUOID

    .LINK
    https://duo.com/docs/adminapi#get-group-info

    #>
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
