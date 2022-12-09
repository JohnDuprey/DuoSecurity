function Test-DuoAuthApi {
    <#
    .SYNOPSIS
    Check Duo API
    
    .DESCRIPTION
    The /check endpoint can be called to verify that the Auth API integration and secret keys are valid, and that the signature is being generated properly.
    
    .EXAMPLE
    Test-DuoAuthApi

    .LINK
    https://duo.com/docs/authapi#/check
    
    .NOTES
    This endpoint is also suitable for use with Duo's v2 Web SDK to verify integration information before initializing frame authentication.
    #>
    [CmdletBinding()]
    Param()

    process {        
        $DuoRequest = @{
            Method = 'GET'
            Path   = '/auth/v2/check'
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
