function Register-DuoUser {
    <#
    .SYNOPSIS
    Enroll User
    
    .DESCRIPTION
    Enroll a user with user name username and email address email and send them an enrollment email that expires after valid_secs seconds. Requires "Grant write resource" API permission.
    
    .PARAMETER Username
    The user name (or username alias) of the user to enroll.
    
    .PARAMETER Email
    The email address of this user.
    
    .PARAMETER ValidSecs
    The number of seconds the enrollment code should remain valid. Default: 2592000 (30 days).
    
    .EXAMPLE
    Register-DuoUser -Username 'bill' -Email 'bill.lumbergh@initech.com'
    
    .LINK
    https://duo.com/docs/adminapi#enroll-user

    .NOTES
    
    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Username,

        [Parameter(Mandatory = $true)]
        [string]$Email,

        [Parameter()]
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

    if ($PSCmdlet.ShouldProcess($Email)) {
        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        }
        else {
            $Request.response
        }
    }
}
