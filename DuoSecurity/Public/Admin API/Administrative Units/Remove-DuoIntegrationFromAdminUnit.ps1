function Remove-DuoGroupFromAdminUnit {
    <#
    .SYNOPSIS
    Remove Integration from Administrative Unit

    .DESCRIPTION
    Unassign the integration with admin_id from the administrative unit with admin_unit_id. Requires "Grant administrators" API permission.

    .PARAMETER AdminUnitId
    The ID of the Administrative Unit

    .PARAMETER IntegrationKey
    The Key of the Integration

    .EXAMPLE
    Remove-DuoIntegrationFromAdminUnit -AdminUnitId SOMEADMINUNITID -IntegrationKey SOMEINTEGRATIONKEY

    .LINK
    https://duo.com/docs/adminapi#remove-integration-from-administrative-unit

    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('admin_unit_id')]
        [string]$AdminUnitId,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('integration_Key')]
        [string]$IntegrationKey
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/administrative_units/{0}/integration/{1}' -f $AdminUnitId, $IntegrationKey
        }

        $Target = 'Unit {0} - Integration {1}' -f $AdminUnitId, $IntegrationKey
        if ($PSCmdlet.ShouldProcess($Target)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}