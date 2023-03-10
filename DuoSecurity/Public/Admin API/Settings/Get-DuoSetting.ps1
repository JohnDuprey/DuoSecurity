function Get-DuoSetting {
    <#
    .SYNOPSIS
    Retrieve Settings

    .DESCRIPTION
    Returns global Duo settings. These settings can also be viewed and set in the Duo Admin Panel. Requires "Grant settings" API permission.

    .EXAMPLE
    Get-DuoSettings

    .LINK
    https://duo.com/docs/adminapi#retrieve-settings

    #>
    [CmdletBinding()]
    Param()

    $DuoRequest = @{
        Method = 'GET'
        Path   = '/admin/v1/settings'
    }

    $Request = Invoke-DuoRequest @DuoRequest
    if ($Request.stat -ne 'OK') {
        $Request
    } else {
        $Request.response
    }
}

Set-Alias -Name Get-DuoSettings -Value Get-DuoSetting
