function Remove-DuoAdminFromAdminUnit {
    <#
    .SYNOPSIS
    Remove Administrator from Administrative Unit

    .DESCRIPTION
    Unassign the administrator with admin_id from the administrative unit with admin_unit_id. The administrator user will still have restricted_by_admin_units set to true, and if the admin is not assigned to any other admin unit they will not be able to view any users or integrations. Be sure to change the value of restricted_by_admin_units to false to permit that admin to view all users and integrations. Requires "Grant administrators" API permission.

    .PARAMETER AdminUnitId
    The ID of the Administrative Unit

    .PARAMETER AdminId
    The ID of the Administrator

    .EXAMPLE
    Remove-DuoAdminFromAdminUnit -AdminUnitId SOMEADMINUNITID -AdminId SOMEADMINID

    .LINK
    https://duo.com/docs/adminapi#remove-administrator-from-administrative-unit

    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('admin_unit_id')]
        [string]$AdminUnitId,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('admin_id')]
        [string]$AdminId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/administrative_units/{0}/admin/{1}' -f $AdminUnitId, $AdminId
        }

        $Target = 'Unit {0} - Admin {1}' -f $AdminUnitId, $AdminId
        if ($PSCmdlet.ShouldProcess($Target)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}