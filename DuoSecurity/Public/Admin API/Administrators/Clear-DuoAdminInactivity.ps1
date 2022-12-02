function Clear-DuoAdminInactivity {
    <#
    .SYNOPSIS
    Clear Administrator Expiration
    
    .DESCRIPTION
    Clear expiration for the administrator with admin_id after the admin has been expired due to inactivity. The administrator's status changes from "Expired" to the status applied to that admin before inactive expiration, and restores access to the Duo Admin Panel if the effective status is "Active". Requires "Grant administrators" API permission.
    
    .PARAMETER AdminId
    The ID of the Administrator
    
    .EXAMPLE
    Clear-DuoAdminInactivity -AdminId SOMEADMINID
    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$AdminId
    )

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/admins/{0}/clear_inactivity' -f $AdminId
    }

    if ($PSCmdlet.ShouldProcess($AdminId)) {
        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        }
        else {
            $Request.response
        }
    }
}
