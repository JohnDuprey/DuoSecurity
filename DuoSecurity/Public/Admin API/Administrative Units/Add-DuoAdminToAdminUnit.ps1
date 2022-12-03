function Add-DuoAdminToAdminUnit {
    <#
    .SYNOPSIS
    Add Administrator to Administrative Unit
    
    .DESCRIPTION
    Assign the administrator with admin_id to the administrative unit with admin_unit_id. The administrator user must have restricted_by_admin_units set to true before attempting to assign them to an administrative unit via the API. Requires "Grant administrators" API permission.
    
    .PARAMETER AdminUnitId
    The ID of the Administrative Unit
    
    .PARAMETER AdminId
    The ID of the Administrator
    
    .EXAMPLE
    Add-DuoAdminToAdminUnit -AdminUnitId SOMEADMINUNITID -AdminId SOMEADMINID

    .LINK
    https://duo.com/docs/adminapi#add-administrator-to-administrative-unit

    .NOTES
    Object limits: 100 groups per user.
    
    #>
    [CmdletBinding(SupportsShouldProcess)]
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
            Method = 'POST'
            Path   = '/admin/v1/administrative_units/{0}/admin/{1}' -f $AdminUnitId, $AdminId  
        }
        $Target = 'Unit: {0} - Admin {1}' -f $AdminUnitId,$AdminId
        if ($PSCmdlet.ShouldProcess($Target)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
