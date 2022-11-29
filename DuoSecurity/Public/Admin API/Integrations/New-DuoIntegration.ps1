function New-DuoIntegration {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Name,

        [Parameter(Mandatory = $true)]
        [string]$Type,

        [ValidateRange(0, 1)]
        [int]$AdminApiAdmins,

        [ValidateRange(0, 1)]
        [int]$AdminApiInfo,

        [ValidateRange(0, 1)]
        [int]$AdminApiIntegrations,

        [ValidateRange(0, 1)]
        [int]$AdminApiReadLog,

        [ValidateRange(0, 1)]
        [int]$AdminApiReadResource,

        [ValidateRange(0, 1)]
        [int]$AdminApiSettings,

        [ValidateRange(0, 1)]
        [int]$AdminApiWriteResource,

        [string]$Greeting,

        [string[]]$GroupsAllowed,

        [string[]]$NetworksForApiAccess,

        [string]$Notes,

        [ValidateRange(0, 1)]
        [int]$SelfServiceAllowed,

        [ValidateSet('None', 'Simple')]
        [string]$UsernameNormalizationPolicy
    )

    $Params = @{
        name = $Name
        type = $Type
    }

    if ($Type -eq 'adminapi') {
        if ($AdminApiAdmins) { $Params.adminapi_admins = $AdminApiAdmins }
        if ($AdminApiInfo) { $Params.adminapi_info = $AdminApiInfo }
        if ($AdminApiIntegrations) { $Params.adminapi_integrations = $AdminApiIntegrations }
        if ($AdminApiReadLog) { $Params.adminapi_read_log = $AdminApiReadLog }
        if ($AdminApiReadResource) { $Params.adminapi_read_resource = $AdminApiReadResource }
        if ($AdminApiWriteResource) { $Params.adminapi_write_resource = $AdminApiWriteResource }
        if ($AdminApiSettings) { $Params.adminapi_settings = $AdminApiSettings }
        if ($NetworksForApiAccess) { $Params.networks_for_api_access = ($NetworksForApiAccess -join ',')}
    }
    elseif ($Type -eq 'accountsapi') {
        if ($NetworksForApiAccess) { $Params.networks_for_api_access = ($NetworksForApiAccess -join ',') }
    }

    if ($Greeting) { $Params.greeting = $Greeting }
    if ($GroupsAllowed) { $Params.groups_allowed = ($GroupsAllowed -join ',') }
    if ($Notes) { $Params.notes = $Notes }
    if ($UsernameNormalizationPolicy) { $Params.username_normalization_policy = $UsernameNormalizationPolicy }

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/integrations'
        Params = $Params
    }

    $Request = Invoke-DuoRequest @DuoRequest
    if ($Request.stat -ne 'OK') {
        $Request
    }
    else {
        $Request.response
    }
}
