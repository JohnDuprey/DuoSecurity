function Update-DuoAdminUnit {
    <#
    .SYNOPSIS
    Modify Administrative Unit
    
    .DESCRIPTION
    Change the name, description, assigned administrators, groups, and/or integrations of the administrative unit with admin_unit_id. Requires "Grant administrators" API permission.

    .PARAMETER AdminUnitId
    The ID of the Administrative Unit
    
    .PARAMETER Name
    The new name of the administrative unit. Must be unique amongst all administrative units.
    
    .PARAMETER Description
    An updated description of the administrative unit.
    
    .PARAMETER RestrictByGroups
    Change whether the administrative unit specifies groups. Default: false.
    
    .PARAMETER RestrictByIntegrations
    Change whether the administrative unit specifies integrations. Default: false.
    
    .PARAMETER Admins
    One or more admin_id values to assign administrators to the new administrative unit. The administrator user must have restricted_by_admin_units set to true before attempting to assign them to an administrative unit via the API.
    
    .PARAMETER Groups
    One or more group_id values to assign groups to the new administrative unit.
    
    .PARAMETER Integrations
    One or more integration_key values to assign integrations to the new administrative unit.
    
    .EXAMPLE
    Update-DuoAdminUnit -AdminUnitId SOMEADMINUNITID -Name 'Accounts Payable Admins' -RestrictByGroups -Groups 'ACCTSPAYABLEGROUPID'

    .LINK
    https://duo.com/docs/adminapi#modify-administrative-unit

    #>
    
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$AdminUnitId,

        [Parameter()]
        [string]$Name,

        [Parameter()]
        [string]$Description,
        
        [Parameter()]
        [switch]$RestrictByGroups,

        [Parameter()]
        [switch]$RestrictByIntegrations,

        [Parameter()]
        [string[]]$Admins,

        [Parameter()]
        [string[]]$Groups,

        [Parameter()]
        [string[]]$Integrations
    )

    $Params = @{}
    if ($Name) { $Params.name = $Name }
    if ($Description) { $Params.description = $Description }

    if ($RestrictByGroups.IsPresent) { 
        $Params.restrict_by_groups = $RestrictByGroups.IsPresent 
        if ($Groups) { $Params.groups = $Groups }
    }
    if ($Admins) { $Params.admins = $Admins }
    if ($RestrictByIntegrations.IsPresent) { 
        $Params.restrict_by_integrations = $RestrictByIntegrations.IsPresent 
        if ($Integrations) { $Params.integrations = $Integrations }
    }

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/admins/{0}' -f $AdminUnitId
        Params = $Params
    }

    if ($PSCmdlet.ShouldProcess($AdminUnitId)) {
        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        }
        else {
            $Request.response
        }
    }
}
