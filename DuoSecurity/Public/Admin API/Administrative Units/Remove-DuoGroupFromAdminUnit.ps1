function Remove-DuoGroupFromAdminUnit {
    <#
    .SYNOPSIS
    Remove Group from Administrative Unit
    
    .DESCRIPTION
    Unassign the group with group_id from the administrative unit with admin_unit_id. Requires "Grant administrators" API permission.
    
    .PARAMETER AdminUnitId
    The ID of the Administrative Unit
    
    .PARAMETER GroupId
    The ID of the Group
    
    .EXAMPLE
    Remove-DuoAdminFromAdminUnit -AdminUnitId SOMEADMINUNITID -AdminId SOMEADMINID

    .LINK
    https://duo.com/docs/adminapi#remove-group-from-administrative-unit

    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('admin_unit_id')]
        [string]$AdminUnitId,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('group_id')]
        [string]$GroupId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/administrative_units/{0}/group/{1}' -f $AdminUnitId, $GroupId
        }

        $Target = 'Unit {0} - Group {1}' -f $AdminUnitId, $GroupId
        if ($PSCmdlet.ShouldProcess($Target)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}