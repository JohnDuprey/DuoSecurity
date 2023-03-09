function Add-DuoIntegrationToAdminUnit {
    <#
    .SYNOPSIS
    Add Integration to Administrative Unit

    .DESCRIPTION
    Assign the integration with integration_key to the administrative unit with admin_unit_id. Requires "Grant administrators" API permission.

    .PARAMETER AdminUnitId
    The ID of the Administrative Unit

    .PARAMETER IntegrationKey
    The Key of the Integration

    .EXAMPLE
    Add-DuoIntegrationToAdminUnit -AdminUnitId SOMEADMINUNITID -IntegrationKey SOMEINTEGRATIONKEY

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
        [Alias('integration_key')]
        [string]$IntegrationKey
    )

    process {
        $DuoRequest = @{
            Method = 'POST'
            Path   = '/admin/v1/administrative_units/{0}/integration/{1}' -f $AdminUnitId, $IntegrationKey
        }
        $Target = 'Unit: {0} - Integration {1}' -f $AdminUnitId, $IntegrationKey
        if ($PSCmdlet.ShouldProcess($Target)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
