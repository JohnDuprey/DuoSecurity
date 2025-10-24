function Get-DuoPassportConfig {
    <#
    .SYNOPSIS
    Retrieve Passport Configuration

    .DESCRIPTION
    Returns the current Duo Passport configuration. Requires "Grant resource - Read" API permission.

    .EXAMPLE
    Get-DuoPassportConfig

    .LINK
    https://duo.com/docs/adminapi#passport

    #>
    [CmdletBinding()]
    Param()

    $DuoRequest = @{
        Method = 'GET'
        Path   = '/admin/v2/passport/config'
    }

    $Request = Invoke-DuoRequest @DuoRequest
    if ($Request.stat -ne 'OK') {
        $Request
    } else {
        $Request.response
    }
}
