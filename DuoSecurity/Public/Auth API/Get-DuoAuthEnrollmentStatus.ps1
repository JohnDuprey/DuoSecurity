function Get-DuoAuthEnrollmentStatus {
    <#
    .SYNOPSIS
    Duo Auth Enrollment Status
    
    .DESCRIPTION
    Check whether a user has completed enrollment.
    
    .PARAMETER UserId
    ID of the user.
    
    .PARAMETER ActivationCode
    Activation code, as returned from /enroll.
    
    .EXAMPLE
    Get-DuoAuthEnrollmentStatus -UserId SOMEUSERID -ActivationCode SOMEACTIVATIONCODE

    .LINK
    https://duo.com/docs/authapi#/enroll_status
    
    .NOTES
    
    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('activation_code')]
        [string]$ActivationCode
    )

    process { 
        $Params = @{
            user_id         = $UserId
            activation_code = $ActivationCode
        }
        
        $DuoRequest = @{
            Method = 'POST'
            Path   = '/auth/v2/enroll_status'
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
