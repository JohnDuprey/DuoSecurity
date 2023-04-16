function Get-DuoActivityLog {
    <#
    .SYNOPSIS
    Activity Logs

    .DESCRIPTION
    eturns a paged list of activity log events ranging from the last 180 days up to as recently as two minutes before the API request. The events returned are subject to log retention, if set up in the account, as described her

    .PARAMETER Days
    Number of days to retrieve with max time of now

    .PARAMETER Hours
    Number of hours to retrieve with max time of now

    .PARAMETER StartDate
    The start date for log entries

    .PARAMETER EndDate
    The end date for log enties

    .PARAMETER MinTime
    Return records that have a 13 character Unix timestamp in milliseconds of mintime or later. This value must be strictly less then maxtime.

    .PARAMETER MaxTime
    Return records that have a 13 character Unix timestamp in milliseconds of maxtime or earlier. This value must be strictly greater then mintime.

    .LINK
    https://duo.com/docs/adminapi#activity-logs

    .EXAMPLE
    Get-DuoActivityLog -Days 30

    .NOTES
    This API endpoint is currently in Public Preview for Duo Access and Beyond. Interested MFA plan customers can contact us to join the preview.

    There is an intentional two-minute delay in the availability of new activity events in the API response. Duo operates a large-scale distributed system, and this two-minute buffer period ensures that calls will return consistent results. Querying for results more recent than two minutes will return as empty.

    We recommend requesting logs no more than once per minute.
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true, ParameterSetName = 'Days')]
        [int]$Days,

        [Parameter(Mandatory = $true, ParameterSetName = 'Hours')]
        [int]$Hours,

        [Parameter(Mandatory = $true, ParameterSetName = 'MinMaxTime')]
        [string]$MinTime,

        [Parameter(Mandatory = $true, ParameterSetName = 'MinMaxTime')]
        [string]$MaxTime,

        [Parameter(Mandatory = $true, ParameterSetName = 'DateTime')]
        [datetime]$StartDate,

        [Parameter(ParameterSetName = 'DateTime')]
        [datetime]$EndDate
    )

    if ($Days) {
        $MaxTime = [int64](Get-Date -UFormat '%s000')
        $MinTime = $MaxTime - [int64](86400000 * $Days)
    }

    if ($Hours) {
        $MaxTime = [int64](Get-Date -UFormat '%s000')
        $MinTime = $MaxTime - [int64](3600000 * $Hours)
    }

    if ($StartDate) {
        if ($EndDate) {
            $MaxTime = $EndDate | Get-Date -UFormat '%s000'
        } else {
            $MaxTime = Get-Date -UFormat '%s000'
        }
        $MinTime = $StartDate | Get-Date -UFormat '%s000'
    }

    $Params = @{
        mintime = $MinTime.ToString()
        maxtime = $MaxTime.ToString()
    }

    $DuoRequest = @{
        Method = 'GET'
        Path   = '/admin/v2/logs/activity'
        Params = $Params
    }
    $Response = Invoke-DuoRequest @DuoRequest
    if ($Response.stat -eq 'OK') {
        $Response.response.items
    } else {
        $Response
    }
}

Set-Alias -Name Get-DuoActivityLogs -Value Get-DuoActivityLog
