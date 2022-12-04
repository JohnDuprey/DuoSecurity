function Get-DuoTrustMonitorEvents {
    <#
    .SYNOPSIS
    Retrieve Trust Monitor Events
    
    .DESCRIPTION
    Returns a paged list of events surfaced by Trust Monitor from the last 180 days. To fetch all results, call repeatedly with the next_offset paging parameter as long as the result metadata has next_offset values. Requires "Grant read log" API permission.

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
    https://duo.com/docs/adminapi#retrieve-events

    .EXAMPLE
    Get-DuoTrustMonitorEvents -Days 30 
    
    .NOTES
    We recommend requesting Trust Monitor events no more than once per minute.
    
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true,ParameterSetName='Days')]
        [int]$Days,

        [Parameter(Mandatory = $true, ParameterSetName = 'Hours')]
        [int]$Hours,

        [Parameter(Mandatory=$true,ParameterSetName='MinMaxTime')]
        [string]$MinTime,

        [Parameter(Mandatory = $true, ParameterSetName = 'MinMaxTime')]
        [string]$MaxTime,

        [Parameter(Mandatory = $true, ParameterSetName = 'DateTime')]
        [datetime]$StartDate,

        [Parameter(ParameterSetName = 'DateTime')]
        [datetime]$EndDate,

        [Parameter()]
        [ValidateSet('auth','bypass_status_enabled')]
        [string]$Type
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
        }
        else {
            $MaxTime = Get-Date -UFormat '%s000'
        }
        $MinTime = $StartDate | Get-Date -UFormat '%s000'
    }

    $Params = @{
        mintime = $MinTime.ToString()
        maxtime = $MaxTime.ToString()
    }

    if ($types) { $Params.types = $Types }


    $DuoRequest = @{
        Method = 'GET'
        Path   = '/admin/v1/trust_monitor/events'
        Params = $Params
    }
    $Response = Invoke-DuoRequest @DuoRequest
    if ($Response.stat -eq 'OK') {
        $Response.response.events
    }
    else { 
        $Response
    }
}
