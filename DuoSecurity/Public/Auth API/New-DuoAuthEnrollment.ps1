function New-DuoAuthEnrollment {
    <#
    .SYNOPSIS
    Duo Auth Enrollment
    
    .DESCRIPTION
    The /enroll endpoint provides a programmatic way to enroll new users with Duo two-factor authentication. It creates the user in Duo and returns a code (as a QR code) that Duo Mobile can scan with its built-in camera. Scanning the QR code adds the user's account to the app so that they receive and respond to Duo Push login requests.
    
    .PARAMETER Username
    Username for the created user. If not given, a random username will be assigned and returned.
    
    .PARAMETER ValidSecs
    Seconds for which the activation code will remain valid. Default: 86400 (one day).
    
    .EXAMPLE
    New-DuoAuthEnrollment
    
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    Param(
        [Parameter()]
        [string]$Username,

        [Parameter()]
        [int]$ValidSecs
    )

    process { 
        $Params = @{}
        if ($Username) { $Params.username = $Username }
        if ($ValidSecs) { $Params.valid_secs = $ValidSecs }
        
        $DuoRequest = @{
            Method = 'POST'
            Path   = '/auth/v2/enroll'
            Params = $Params
        }

        $Response = Invoke-DuoRequest @DuoRequest
        if ($Response.stat -eq 'OK') {
            $Response.response
        }
        else { 
            $Response
        }
    }
}
