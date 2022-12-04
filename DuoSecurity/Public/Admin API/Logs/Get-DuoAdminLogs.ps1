function Get-DuoAdminLogs {
    <#
    .SYNOPSIS
    Administrator Logs
    
    .DESCRIPTION
    Returns a list of administrator log events. Only the 1000 earliest events will be returned; you may need to call this multiple times with mintime to page through the entire log. Requires "Grant read log" API permission.
    
    .PARAMETER MinTime
    Limit report to events after this Unix timestamp.
    
    .EXAMPLE
    Get-DuoUserAuthenticationAttempts
    
    .LINK
    https://duo.com/docs/adminapi#administrator-logs

    .NOTES
    We recommend requesting logs no more than once per minute.

    #>
    [CmdletBinding(DefaultParameterSetName='None')]
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
        Path   = '/admin/v1/logs/administrator'
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