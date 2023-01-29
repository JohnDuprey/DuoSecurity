function Get-DuoAuthProxyLogs {
    <#
    .SYNOPSIS
    This script reads Duo Auth Proxy log files
    
    .DESCRIPTION
    Reads in log files from the designated log path and parses the entries from the standard log file format or json in the case of ssoevents
    
    .PARAMETER ListLogs
    List available log files
    
    .PARAMETER LogName
    Name of log to get
    
    .PARAMETER Search
    Search object for string
    
    .EXAMPLE
    Get-DuoAuthProxyLogs -LogName ssoevents -Search test
    
    #>
    [CmdletBinding()]
    Param(
        [Parameter(ParameterSetName = 'List')]
        [switch]$ListLogs,

        [Parameter(ParameterSetName = 'Logs')]
        [string]$LogName,

        [Parameter(ParameterSetName = 'Logs')]
        [string]$Search
    )

    if ($IsLinux) {
        $ProxyBin = '/opt/duoauthproxy/bin/authproxyctl'
        $DuoPath = '/opt/duoauthproxy'
    }

    elseif ($IsWindows) {
        $ProxyBin = '{0}\Duo Security Authentication Proxy\bin\authproxyctl.exe' -f $env:ProgramFiles
        $DuoPath = '{0}\Duo Security Authentication Proxy' -f $env:ProgramFiles
    }

    else {
        throw 'Unsupported OS'
    }

    if (-not (Test-Path $ProxyBin)) {
        $DuoPath = '{0}\Duo Security Authentication Proxy' -f ${env:ProgramFiles(x86)}
        if (Test-Path $DuoPath) {
            Write-Warning 'You are not running a v5.1.0 or higher version of Duo Security Authentication Proxy, please update at your earliest convenience'
        }
        
        else {
            throw 'Duo Security Authentication Proxy not detected'
        }
    }

    $LogPath = Join-Path $DuoPath 'log'

    if ($ListLogs.IsPresent) {
        Get-ChildItem -Path $LogPath/*.log | Select-Object -ExpandProperty BaseName
    }

    else {
        $Logs = Get-Content -Path $LogPath/$LogName.log

        switch ($LogName) {
            'ssoevents' {
                $ParsedLogs = foreach ($Log in $Logs) { 
                    $Log | ConvertFrom-Json
                }
            }
            'install' {
                Get-Content -Path $LogPath/$LogName.log -Encoding Unicode
            }
            default {
                $ParsedLogs = foreach ($Log in $Logs) {
                    if ($Log -match '^(?<Date>.+?)\s\[(?<Type>.+?)\]\s(?<Message>.+)$') {
                        [PSCustomObject]@{
                            Date    = Get-Date $Matches.Date
                            Type    = $Matches.Type
                            Message = $Matches.Message
                        }
                    }
                }
            }
        }
        if ($Search) {
            $ParsedLogs -match $Search
        }

        else {
            $ParsedLogs
        }
    }
}
