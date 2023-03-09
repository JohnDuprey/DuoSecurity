function Send-DuoAuthPing {
    <#
    .SYNOPSIS
    Duo API Ping

    .DESCRIPTION
    The /ping endpoint acts as a "liveness check" that can be called to verify that Duo is up before trying to call other Auth API endpoints. Unlike the other endpoints, this one does not have to be signed with the Authorization header.

    .EXAMPLE
    Send-DuoAuthPing

    .LINK
    https://duo.com/docs/authapi#/ping

    .NOTES
    This endpoint is also suitable for use with Duo's v2 Web SDK to verify that Duo's service is responding before initializing frame authentication.
    #>
    [CmdletBinding()]
    Param()

    process {
        $DuoRequest = @{
            Method = 'GET'
            Path   = '/auth/v2/ping'
            NoAuth = $true
        }

        $Response = Invoke-DuoRequest @DuoRequest
        if ($Response.stat -eq 'OK') {
            $Response.response
        } else {
            $Response
        }
    }
}
