function Update-DuoIntegration {
    <#
    .SYNOPSIS
    Modify Integration
    
    .DESCRIPTION
    Change the name, enrollment policy, greeting, and/or notes of the integration with integration key integration_key, or reset its secret key. When modifying an Admin API integration permissions can also be added or removed. Requires "Grant applications" API permission.
    
    .PARAMETER IntegrationKey
    Integration key to update
    
    .PARAMETER Name
    New name for the integration.
    
    .PARAMETER NetworksForApiAccess
    A comma-separated list of IP addresses, IP ranges, or CIDRs specifying the networks allowed to access this API integration. Only applicable to Accounts API and Admin API integrations. A given API integration may apply a network restriction to itself via API; use a different API integration to apply the network restriction, or edit the API application in the Duo Admin Panel GUI.

    .PARAMETER AdminApiAdmins
    Set to 1 to grant an Admin API integration permission for all Admins methods or 0 to remove access to them.
    
    .PARAMETER AdminApiInfo
    Set to 1 to grant an Admin API integration permission for all Account Info methods or 0 to remove access to them.
    
    .PARAMETER AdminApiIntegrations
    Set to 1 to grant an Admin API integration permission for all Integrations methods or 0 to remove access to them.
    
    .PARAMETER AdminApiReadLog
    Set to 1 to grant an Admin API integration permission for all Logs methods or 0 to remove access to them.
    
    .PARAMETER AdminApiReadResource
    Set to 1 to grant an Admin API integration permission to retrieve objects like users, phones, and hardware tokens or 0 to remove access to them.
    
    .PARAMETER AdminApiSettings
    Set to 1 to grant an Admin API integration permission for all Settings methods or 0 to remove access to them.
    
    .PARAMETER AdminApiWriteResource
    Set to 1to grant an Admin API integration permission to create and modify objects like users, phones, and hardware tokens or 0 to remove access to them.
    
    .PARAMETER Greeting
    New voice greeting. Will be read before the authentication instructions to users who authenticate with a phone callback.
    
    .PARAMETER GroupsAllowed
    A comma-separated list of group IDs that are allowed to authenticate with the integration. If set to an empty string, all groups will be allowed.
    
    Object limits: 100 groups per integration.

    .PARAMETER Notes
    New description of the integration.
    
    .PARAMETER PolicyKey
    Specify the "Policy Key" value for a custom policy to attach it to the specified integration. Obtain a policy's key by viewing it in the Duo Admin Panel's "Policies" page or from the output of Retrieve Integrations. Leave the value blank to detach the currently attached policy from an integration.
    
    .PARAMETER PromptV4Enabled
    Set to 1 to activate Duo Universal Prompt for the application, or to 0 to revert back to traditional prompt. Only appears for a given integration when frameless_auth_prompt_enabled is 1 (value set automatically when Duo detects a frameless authentication for the integration).
    
    .PARAMETER ResetSecretKey
    If set to 1, resets the integration's secret key to a new, randomly generated value. The new secret key is returned in the return value. Attempting to reset the secret key for the same Admin API integration whose integration key and secret key are used to make this call will return an error.
    
    .PARAMETER SelfServiceAllowed
    Set to 1 to grant an integration permission to allow users to manage their own devices. This is only supported by integrations which allow for self service configuration.
    
    .PARAMETER UsernameNormalizationPolicy
    New policy for whether or not usernames should be altered before trying to match them to a user account. Refer to Retrieve Integrations for a list of valid values.
    
    .EXAMPLE
    Update-DuoIntegration -IntegrationKey SOMEDUOKEY -Greeting 'Welcome to Duo.'
    
    .NOTES
    General notes
    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$IntegrationKey,

        [Parameter()]
        [string]$Name,

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
        [string]$PolicyKey,

        [Parameter()]
        [ValidateRange(0, 1)]
        [int]$PromptV4Enabled,

        [Parameter()]
        [ValidateRange(0, 1)]
        [int]$ResetSecretKey,

        [Parameter()]
        [ValidateRange(0, 1)]
        [int]$SelfServiceAllowed,

        [Parameter()]
        [ValidateSet('None', 'Simple')]
        [string]$UsernameNormalizationPolicy
    )

    $Params = @{}
    if ($Name) { $Params.name = $Name }
    if ($AdminApiAdmins) { $Params.adminapi_admins = $AdminApiAdmins }
    if ($AdminApiInfo) { $Params.adminapi_info = $AdminApiInfo }
    if ($AdminApiIntegrations) { $Params.adminapi_integrations = $AdminApiIntegrations }
    if ($AdminApiReadLog) { $Params.adminapi_read_log = $AdminApiReadLog }
    if ($AdminApiReadResource) { $Params.adminapi_read_resource = $AdminApiReadResource }
    if ($AdminApiWriteResource) { $Params.adminapi_write_resource = $AdminApiWriteResource }
    if ($AdminApiSettings) { $Params.adminapi_settings = $AdminApiSettings }
    if ($NetworksForApiAccess) { $Params.networks_for_api_access = ($NetworksForApiAccess -join ',') }
    if ($Greeting) { $Params.greeting = $Greeting }
    if ($GroupsAllowed) { $Params.groups_allowed = ($GroupsAllowed -join ',') }
    if ($Notes) { $Params.notes = $Notes }
    if ($PolicyKey) { $Params.policy_key = $PolicyKey }
    if ($PromptV4Enabled) { $Params.prompt_v4_enabled = $PromptV4Enabled }
    if ($ResetSecretKey) { $Params.reset_secret_key = $ResetSecretKey }
    if ($UsernameNormalizationPolicy) { $Params.username_normalization_policy = $UsernameNormalizationPolicy }

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/integrations/{0}' -f $IntegrationKey
        Params = $Params
    }

    if ($PSCmdlet.ShouldProcess($IntegrationKey)) {
        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        }
        else {
            $Request.response
        }
    }
}
