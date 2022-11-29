function Register-DuoUser {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Username,

        [Parameter(Mandatory = $true)]
        [string]$Email,

        [int]$ValidSecs = 2592000
    )

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/users/enroll'
        Params = @{
            username   = $Username
            email      = $Email
            valid_secs = $ValidSecs
        }
    }

    $Request = Invoke-DuoRequest @DuoRequest
    if ($Request.stat -ne 'OK') {
        $Request
    }
    else {
        $Request.response
    }
}
