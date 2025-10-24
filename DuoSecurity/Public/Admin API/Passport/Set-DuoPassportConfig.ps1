function Set-DuoPassportConfig {
    <#
    .SYNOPSIS
    Modify Passport Configuration

    .DESCRIPTION
    Change Duo Passport configuration settings. Requires "Grant resource - Write" API permission.

    .PARAMETER EnabledStatus
    Enable or disable Duo Passport for the account.

    .PARAMETER EnabledGroups
    Array of group IDs that should have access to Duo Passport.

    .PARAMETER CustomSupportedBrowsers
    Array of custom browser configurations for Duo Passport.

    .EXAMPLE
    Set-DuoPassportConfig -EnabledStatus $true

    .EXAMPLE
    Set-DuoPassportConfig -EnabledStatus $true -EnabledGroups @('group1', 'group2')

    .LINK
    https://duo.com/docs/adminapi#passport

    .INPUTS
    None

    .OUTPUTS
    PSCustomObject. Duo Passport configuration response

    .NOTES

    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter()]
        [bool]$EnabledStatus,

        [Parameter()]
        [string[]]$EnabledGroups,

        [Parameter()]
        [string[]]$CustomSupportedBrowsers
    )

    $Params = @{}

    if ($EnabledStatus -ne $null) { $Params.enabled_status = $EnabledStatus }
    if ($EnabledGroups) { $Params.enabled_groups = $EnabledGroups }
    if ($CustomSupportedBrowsers) { $Params.custom_supported_browsers = $CustomSupportedBrowsers }

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v2/passport/config'
        Params = $Params
    }

    if ($PSCmdlet.ShouldProcess('Duo Passport Configuration')) {
        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        } else {
            $Request.response
        }
    }
}
