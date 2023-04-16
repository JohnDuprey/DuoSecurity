function New-DuoIntegration {
    <#
    .SYNOPSIS
    Create Integration

    .DESCRIPTION
    Create a new integration. The new integration key and secret key are randomly generated and returned in the response. Requires "Grant applications" API permission.

    .PARAMETER Name
    The name of the integration to create.

    .PARAMETER Type
    The type of the integration to create. Refer to Retrieve Integrations for a list of valid values. Note that integrations of type "azure-ca" (Microsoft Azure Active Directory) and all Duo Single Sign-On applications may not be created via the API. If an integration has reached the Duo end of support then new instances of that integration may not be created with the API.

    .PARAMETER AdminApiAdmins
    Set to 1 to grant an Admin API integration permission for all Admins methods. Default: 0

    .PARAMETER AdminApiInfo
    If creating an Admin API integration, set this to 1 to grant it permission for all Account Info methods. Default: 0.

    .PARAMETER AdminApiIntegrations
    Set to 1 to grant an Admin API integration permission for all Integrations methods. Default: 0.

    .PARAMETER AdminApiReadLog
    Set to 1 to grant an Admin API integration permission for all Logs methods. Default: 0.

    .PARAMETER AdminApiReadResource
    Set to 1 to grant an Admin API integration permission to retrieve objects like users, phones, and hardware tokens. Default: 0.

    .PARAMETER AdminApiSettings
    Set to 1 to grant an Admin API integration permission for all Settings methods. Default: 0.

    .PARAMETER AdminApiWriteResource
    Set to 1 to grant an Admin API integration permission to create and modify objects like users, phones, and hardware tokens. Default: 0.

    .PARAMETER Greeting
    Voice greeting read before the authentication instructions to users who authenticate with a phone callback.

    .PARAMETER GroupsAllowed
    A comma-separated list of group IDs that are allowed to authenticate with the integration. If empty, all groups are allowed.

    Object limits: 100 groups per integration.

    .PARAMETER NetworksForApiAccess
    A comma-separated list of IP addresses, IP ranges, or CIDRs specifying the networks allowed to access this API integration. Only applicable to Accounts API and Admin API integrations. A given API integration may apply a network restriction to itself via API; use a different API integration to apply the network restriction, or edit the API application in the Duo Admin Panel GUI.

    .PARAMETER Notes
    Description of the integration.

    .PARAMETER SelfServiceAllowed
    Set to 1to grant an integration permission to allow users to manage their own devices. This is only supported by integrations which allow for self service configuration.

    .PARAMETER UsernameNormalizationPolicy
    Policy for whether or not usernames should be altered before trying to match them to a user account. Refer to Retrieve Integrations for a list of valid values.

    .EXAMPLE
    New-DuoIntegration -Type adminapi -AdminApiReadLog 1 -Name 'SIEM logging' -Notes 'This integration is for ingesting logs for SIEM'

    .LINK
    https://duo.com/docs/adminapi#create-integration

    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Name,

        [Parameter(Mandatory = $true)]
        [string]$Type,

        [Parameter()]
        [ValidateRange(0, 1)]
        [int]$AdminApiAdmins,

        [Parameter()]
        [ValidateRange(0, 1)]
        [int]$AdminApiInfo,

        [Parameter()]
        [ValidateRange(0, 1)]
        [int]$AdminApiIntegrations,

        [Parameter()]
        [ValidateRange(0, 1)]
        [int]$AdminApiReadLog,

        [Parameter()]
        [ValidateRange(0, 1)]
        [int]$AdminApiReadResource,

        [Parameter()]
        [ValidateRange(0, 1)]
        [int]$AdminApiSettings,

        [Parameter()]
        [ValidateRange(0, 1)]
        [int]$AdminApiWriteResource,

        [Parameter()]
        [string]$Greeting,

        [Parameter()]
        [string[]]$GroupsAllowed,

        [Parameter()]
        [string[]]$NetworksForApiAccess,

        [Parameter()]
        [string]$Notes,

        [Parameter()]
        [ValidateRange(0, 1)]
        [int]$SelfServiceAllowed,

        [Parameter()]
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
        if ($NetworksForApiAccess) { $Params.networks_for_api_access = ($NetworksForApiAccess -join ',') }
    }

    elseif ($Type -eq 'accountsapi') {
        if ($NetworksForApiAccess) { $Params.networks_for_api_access = ($NetworksForApiAccess -join ',') }
    }

    if ($Greeting) { $Params.greeting = $Greeting }
    if ($GroupsAllowed) { $Params.groups_allowed = ($GroupsAllowed -join ',') }
    if ($Notes) { $Params.notes = $Notes }
    if ($SelfServiceAllowed) { $Params.self_service_allowed = $SelfServiceAllowed }
    if ($UsernameNormalizationPolicy) { $Params.username_normalization_policy = $UsernameNormalizationPolicy }

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/integrations'
        Params = $Params
    }

    if ($PSCmdlet.ShouldProcess($Name)) {
        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        } else {
            $Request.response
        }
    }
}
