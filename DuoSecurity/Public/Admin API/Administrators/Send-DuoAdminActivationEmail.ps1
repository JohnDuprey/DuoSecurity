function Send-DuoAdminActivationEmail {
    <#
    .SYNOPSIS
    Email Activation Link to Administrator Pending Activation

    .DESCRIPTION
    Email the current activation link to the administrator pending activation with the administrator ID admin_id. Requires "Grant administrators" API permission.

    .PARAMETER AdminId
    The ID of the Administrator

    .EXAMPLE
    Send-DuoAdminActivationEmail -AdminId SOMEADMINID

    .LINK
    https://duo.com/docs/adminapi#email-activation-link-to-administrator-pending-activation

    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$AdminId
    )

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/admins/{0}/activation_link/email' -f $AdminId
    }

    if ($PSCmdlet.ShouldProcess($AdminId)) {
        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        } else {
            $Request.response
        }
    }
}
