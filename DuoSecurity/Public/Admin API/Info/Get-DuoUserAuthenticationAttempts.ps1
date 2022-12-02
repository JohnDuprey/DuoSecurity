function Get-DuoUserAuthenticationAttempts {
    <#
    .SYNOPSIS
    Users with Authentication Attempts Report
    
    .DESCRIPTION
    Retrieve counts of users with authentication attempts for a given time period (not to exceed 180 days), broken down by result. Each count is the number of users who had at least one authentication attempt ending with that result. Requires "Grant read information" API permission.
    
    .PARAMETER MaxTime
    Limit report to events before this Unix timestamp. Defaults to the current time.
    
    .PARAMETER MinTime
    Limit report to events after this Unix timestamp. Defaults to thirty days before maxtime.
    
    .EXAMPLE
    Get-DuoUserAuthenticationAttempts
    
    .LINK
    https://duo.com/docs/adminapi#users-with-authentication-attempts-report

    #>
    [CmdletBinding()]
    Param(
        [Parameter()]
        [int]$MaxTime,

        [Parameter()]
        [int]$MinTime
    )

    $Params = @{}
    if ($MaxTime) { $Params.maxtime = $MaxTime }
    if ($MinTime) { $Params.mintime = $MinTime }

    $DuoRequest = @{
        Method = 'GET'
        Path   = '/admin/v1/info/user_authentication_attempts'
        Params = $Params
    }

    $Request = Invoke-DuoRequest @DuoRequest
    
    if ($Request.stat -ne 'OK') {
        $Request
    }
    else {
        $Request.response
    }
    
} 