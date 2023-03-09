function Add-DuoGroupToAdminUnit {
    <#
    .SYNOPSIS
    Add Group to Administrative Unit

    .DESCRIPTION
    Assign the group with group_id to the administrative unit with admin_unit_id. Requires "Grant administrators" API permission.

    .PARAMETER AdminUnitId
    The ID of the Administrative Unit

    .PARAMETER GroupId
    The ID of the Group

    .EXAMPLE
    Add-DuoGroupToAdminUnit -AdminUnitId SOMEADMINUNITID -GroupId SOMEGROUPID

    .LINK
    https://duo.com/docs/adminapi#add-group-to-administrative-unit

    .NOTES


    #>
    [CmdletBinding(SupportsShouldProcess)]
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
            Method = 'POST'
            Path   = '/admin/v1/administrative_units/{0}/group/{1}' -f $AdminUnitId, $GroupId
        }
        $Target = 'Unit: {0} - Group {1}' -f $AdminUnitId, $GroupId
        if ($PSCmdlet.ShouldProcess($Target)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
