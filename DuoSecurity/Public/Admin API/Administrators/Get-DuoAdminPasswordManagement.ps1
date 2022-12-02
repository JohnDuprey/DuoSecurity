function Get-DuoAdminPasswordManagement {
    <#
    .SYNOPSIS
    Retrieve Admin External Password Management Status
    
    .DESCRIPTION
    Returns a paged list of administrators indicating whether they have been configured for external password management. Requires "Grant administrators" API permission.

    .EXAMPLE
    Get-DuoAdminPasswordManagement
    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias('admin_id')]
        [string]$AdminId
    )

    process {
        if ($AdminId) {
            $Path = '/admin/v1/admins/{0}/password_mgmt' -f $AdminId
        }
        else {
            $Path = '/admin/v1/password_mgmt'
        }
        $DuoRequest = @{
            Method = 'GET'
            Path   = $Path
        }

        if ($AdminId) {
            $Request = Invoke-DuoRequest @DuoRequest
            if ($Request.stat -ne 'OK') {
                $Request
            }
            else {
                $Request.response
            } 
        }
        else { 
            Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest 
        }  
    }
} 

