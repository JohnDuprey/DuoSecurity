function Remove-DuoAdmin {
    <#
    .SYNOPSIS
    Delete Administrator

    .DESCRIPTION
    Delete the administrator with administrator ID admin_id from the system. Administrators managed by directory sync can not be deleted via API. Requires "Grant administrators" API permission.

    .PARAMETER AdminId
    The ID of the Administrator

    .EXAMPLE
    Remove-DuoAdmin -AdminId SOMEADMINID

    .LINK
    https://duo.com/docs/adminapi#delete-administrator
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
            path   = '/admin/v1/admins/{0}' -f $AdminId
        }
        if ($PSCmdlet.ShouldProcess($AdminId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
