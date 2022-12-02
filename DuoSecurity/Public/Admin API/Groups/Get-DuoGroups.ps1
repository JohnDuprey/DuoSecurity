function Get-DuoGroups {
    <#
    .SYNOPSIS
    Retrieve Groups
    
    .DESCRIPTION
    Returns a single group or a paged list of groups. Requires "Grant read resource" API permission.
    
    .PARAMETER GroupId
    Group Id to retrieve
    
    .EXAMPLE
    Get-DuoGroups
    
    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias('group_id')]
        $GroupId
    )

    process {
        if ($GroupId) {
            $Path = '/admin/v2/groups/{0}' -f $GroupId
        }
        else {
            $Path = '/admin/v1/groups'
            $Params = @{ offset = 0 }
        }
    
        $DuoRequest = @{
            Method = 'GET'
            Path   = $Path
        }
        if ($Params) {
            $DuoRequest.Params = $Params
            Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest
        }
        else {
            $Request = Invoke-DuoRequest @DuoRequest
            if ($Request.stat -ne 'OK') {
                $Request
            }
            else {
                $Request.response
            }
        }
    }
} 

Set-Alias -Name Get-DuoGroup -Value Get-DuoGroups
