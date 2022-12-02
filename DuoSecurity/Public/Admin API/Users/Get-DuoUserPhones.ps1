function Get-DuoUserPhones {
    <#
    .SYNOPSIS
    Retrieve Phones by User ID
    
    .DESCRIPTION
    Returns a paged list of phones associated with the user with ID user_id. Requires "Grant read resource" API permission.
    
    .PARAMETER UserId
    THe ID of the user
    
    .EXAMPLE
    Get-DuoUserPhones -UserId SOMEUSERID

    .LINK
    https://duo.com/docs/adminapi#retrieve-phones-by-user-id
    
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
            Path   = '/admin/v1/users/{0}/phones' -f $UserId    
        }
        Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest
    }
}
