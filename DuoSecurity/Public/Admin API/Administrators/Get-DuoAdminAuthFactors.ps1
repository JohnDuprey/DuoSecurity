function Get-DuoAdminAuthFactors {
    <#
    .SYNOPSIS
    Retrieve Administrator Authentication Factors

    .DESCRIPTION
    Retrieve a list of the secondary authentication methods permitted for administrator log on to the Duo Admin Panel. Requires "Grant administrators" API permission.

    .EXAMPLE
    Get-DuoAdminAuthFactors

    .LINK
    https://duo.com/docs/adminapi#retrieve-administrator-authentication-factors

    #>
    [CmdletBinding()]
    Param()

    process {
        $Path = '/admin/v1/allowed_auth_methods'

        $DuoRequest = @{
            Method = 'GET'
            Path   = $Path
        }

        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        } else {
            $Request.response
        }
    }
}
