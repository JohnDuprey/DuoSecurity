function Get-DuoUserGroups {
    <#
    .SYNOPSIS
    Retrieve Groups by User ID
    
    .DESCRIPTION
    Returns a paged list of groups associated with the user with ID user_id. Requires "Grant read resource" API permission.
    
    .PARAMETER UserId
    The ID of the User
    
    .EXAMPLE
    Get-DuoUserGroups -UserId SOME USERID
    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId
    )

    process { 
        $DuoRequest = @{
            Method = 'GET'
            Path   = '/admin/v1/users/{0}/groups' -f $UserId    
        }
        Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest
    }
}
