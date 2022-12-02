function New-DuoAdminActivationLink {
    <#
    .SYNOPSIS
    Create Activation Link for Administrator Pending Activation
    
    .DESCRIPTION
    Creates an activation link for the administrator pending activation with the administrator ID admin_id. There must not already be an existing activation link for the admin. Requires "Grant administrators" API permission.
    
    .PARAMETER AdminId
    The ID of the Administrator
    
    .EXAMPLE
    New-DuoAdminActivationLink -AdminId SOMEADMINID
    
    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$AdminId
    )

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/admins/{0}/activation_link' -f $AdminId
        Params = $Params
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
