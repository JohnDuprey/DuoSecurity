function Get-DuoOfflineEnrollmentLogs {
    <#
    .SYNOPSIS
    Offline Enrollment Logs

    .DESCRIPTION
    Returns a list of Duo Authentication for Windows Logon offline enrollment events ranging from the last 180 days up to as recently as two minutes before the API request. There is an intentional two minute delay in availability of new authentications in the API response. Duo operates a large scale distributed system, and this two minute buffer period ensures that calls will return consistent results. Querying for results more recent than two minutes will return as empty. Requires "Grant read log" API permission.

    The 1000 earliest events will be returned; you may need to call this multiple times with mintime to page through the entire log. Note that more or fewer than 1000 events may be returned depending on how many actual events exist for the specified mintime.

    .PARAMETER MinTime
    Only return records that have a Unix timestamp in seconds of mintime or later. Use mintime+1 to avoid receiving duplicate data.

    .EXAMPLE
    Get-DuoOfflineEnrollmentLogs

    .LINK
    https://duo.com/docs/adminapi#offline-enrollment-logs

    .NOTES
    We recommend requesting logs no more than once per minute.

    #>
    [CmdletBinding(DefaultParameterSetName = 'None')]
    Param(
        [Parameter(ParameterSetName = 'UnixTime')]
        [string]$MinTime,

        [Parameter(ParameterSetName = 'DateTime')]
        [string]$StartDate,

        [Parameter(ParameterSetName = 'Days')]
        [int]$Days,

        [Parameter(ParameterSetName = 'Hours')]
        [int]$Hours
    )

    if ($StartDate) {
        $MinTime = $StartDate | Get-Date -UFormat '%s'
    }

    if ($Days) {
        $MaxTime = [int64](Get-Date -UFormat '%s')
        $MinTime = $MaxTime - [int64](86400 * $Days)
    }

    if ($Hours) {
        $MaxTime = [int64](Get-Date -UFormat '%s')
        $MinTime = $MaxTime - [int64](3600 * $Hours)
    }

    $Params = @{}

    if ($MinTime) { $Params.mintime = $MinTime.ToString() }

    $DuoRequest = @{
        Method = 'GET'
        Path   = '/admin/v1/logs/offline_enrollment'
        Params = $Params
    }

    $Request = Invoke-DuoRequest @DuoRequest

    if ($Request.stat -ne 'OK') {
        $Request
    } else {
        $Request.response
    }

}