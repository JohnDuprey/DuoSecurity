function New-DuoAdminUnit {
    <#
    .SYNOPSIS
    Add Administrative Unit
    
    .DESCRIPTION
    Add a new administrative unit with specified administrators, groups, or other parameters. Requires "Grant administrators" API permission.
    
    .PARAMETER Name
    The name of the new administrative unit. Must be unique amongst all administrative units.
    
    .PARAMETER Description
    A description of the new administrative unit.
    
    .PARAMETER RestrictByGroups
    Does the new administrative unit specify groups? Default: false.
    
    .PARAMETER RestrictByIntegrations
    Does the new administrative unit specify integrations? Default: false.
    
    .PARAMETER Admins
    One or more admin_id values to assign administrators to the new administrative unit. The administrator user must have restricted_by_admin_units set to true before attempting to assign them to an administrative unit via the API.
    
    .PARAMETER Groups
    One or more group_id values to assign groups to the new administrative unit.
    
    .PARAMETER Integrations
    One or more integration_key values to assign integrations to the new administrative unit.
    
    .EXAMPLE
    New-DuoAdminUnit -Name 'Accounts Payable Admins' -RestrictByGroups -Groups 'ACCTSPAYABLEGROUPID'

    .LINK
    https://duo.com/docs/adminapi#add-administrative-unit

    #>
    
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Name,

        [Parameter(Mandatory = $true)]
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

    $Params = @{
        name               = $Name
        description        = $Description
        restrict_by_groups = $RestrictByGroups.IsPresent
    }

    if ($Admins) { $Params.admins = $Admins }

    if ($RestrictByGroups.IsPresent) { 
        if ($Groups) { $Params.groups = $Groups }
    }

    if ($RestrictByIntegrations.IsPresent) { 
        $Params.restrict_by_integrations = $RestrictByIntegrations.IsPresent 
        if ($Integrations) { $Params.integrations = $Integrations}
    }

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/admins'
        Params = $Params
    }

    if ($PSCmdlet.ShouldProcess($Name)) {
        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        }
        else {
            $Request.response
        }
    }
}
