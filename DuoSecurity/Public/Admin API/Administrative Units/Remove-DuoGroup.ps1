function Remove-DuoAdminUnit {
    <#
    .SYNOPSIS
    Delete Administrative Unit
    
    .DESCRIPTION
    Delete the administrative unit with admin_unit_id from the system. Requires "Grant administrators" API permission.
    
    .PARAMETER AdminUnitId
    Admin Unit Id to remove
    
    .EXAMPLE
    Remove-DuoAdminUnit -AdminUnitId SOMEDUOID

    .LINK
    https://duo.com/docs/adminapi#delete-administrative-unit
    
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('admin_unit_id')]
        [string]$AdminUnitId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/administrative_units/{0}' -f $AdminUnitId
        }

        if ($PSCmdlet.ShouldProcess($AdminUnitId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
