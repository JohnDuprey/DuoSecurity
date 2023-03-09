function Get-DuoCustomMessaging {
    <#
    .SYNOPSIS
    Retrieve Custom Messaging

    .DESCRIPTION
    Returns effective custom messaging settings, shown to users in the Universal Prompt. These settings can also be viewed and set in the Duo Admin Panel. Supersedes the helpdesk_message Settings parameter. Requires "Grant settings" API permission.

    .EXAMPLE
    Get-DuoCustomMessaging

    .INPUTS
    None

    .OUTPUTS
    PSCustomObject. Returns a Duo Custom Messaging object.

    .LINK
    https://duo.com/docs/adminapi#retrieve-custom-messaging

    .NOTES

    #>
    [CmdletBinding()]
    Param()

    $DuoRequest = @{
        Method = 'GET'
        Path   = '/admin/v1/branding/custom_messaging'
    }

    $Request = Invoke-DuoRequest @DuoRequest
    if ($Request.stat -ne 'OK') {
        $Request
    } else {
        $Request.response
    }
}
