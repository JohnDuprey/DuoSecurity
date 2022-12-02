function Get-DuoAdmins {
    <#
    .SYNOPSIS
    Retrieve Administrators
    
    .DESCRIPTION
    Returns a single admin or a paged list of administrators. Requires "Grant administrators" API permission.
    
    .PARAMETER AdminId
    The ID of the Adminstrator
    
    .EXAMPLE
    Get-DuoAdmins
    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias('admin_id')]
        [string]$AdminId
    )

    process {
        if ($AdminId) {
            $Path = '/admin/v1/admins/{0}' -f $AdminId
        }
        else {
            $Path = '/admin/v1/admins'
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

Set-Alias -Name Get-DuoAdmin -Value Get-DuoAdmins
