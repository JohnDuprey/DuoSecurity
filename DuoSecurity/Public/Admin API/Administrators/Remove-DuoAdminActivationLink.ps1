function Remove-DuoAdminActivationLink {
    <#
    .SYNOPSIS
    Delete Activation Link from Administrator Pending Activation

    .DESCRIPTION
    Deletes and invalidates the current activation link from the administrator pending activation with the administrator ID admin_id. Requires "Grant administrators" API permission.

    .PARAMETER AdminId
    The ID of the Administrator

    .EXAMPLE
    Remove-DuoAdminActivationLink -AdminId SOMEADMINID

    .LINK
    https://duo.com/docs/adminapi#delete-activation-link-from-administrator-pending-activation

    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('admin_id')]
        [string]$AdminId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/admins/{0}/activation_link' -f $AdminId
        }
        if ($PSCmdlet.ShouldProcess($AdminId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
