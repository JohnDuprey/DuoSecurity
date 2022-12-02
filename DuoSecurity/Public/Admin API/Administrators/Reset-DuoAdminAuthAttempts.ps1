function Reset-DuoAdminAuthAttempts {
    <#
    .SYNOPSIS
    Reset Administrator Authentication Attempts
    
    .DESCRIPTION
    Clear the number of failed login attempts for the administrator with admin_id. Re-enables an administrator who has been disabled due to too many failed authentication attempts. Requires "Grant administrators" API permission.
    
    .PARAMETER AdminId
    The ID of the Administrator
    
    .EXAMPLE
    Reset-DuoAdminAuthAttempts -AdminId SOMEADMINID

    .LINK
    https://duo.com/docs/adminapi#reset-administrator-authentication-attempts

    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$AdminId
    )

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/admins/{0}/reset' -f $AdminId
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
