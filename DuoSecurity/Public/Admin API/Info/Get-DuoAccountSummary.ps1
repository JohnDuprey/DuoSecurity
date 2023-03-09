function Get-DuoAccountSummary {
    <#
    .SYNOPSIS
    Retrieve Summary

    .DESCRIPTION
    Returns a summary of account utilization information. Requires "Grant read information" API permission.

    .EXAMPLE
    Get-DuoAccountSummary

    .LINK
    https://duo.com/docs/adminapi#retrieve-summary

    #>
    [CmdletBinding()]
    Param()

    $DuoRequest = @{
        Method = 'GET'
        Path   = '/admin/v1/info/summary'
    }

    $Request = Invoke-DuoRequest @DuoRequest

    if ($Request.stat -ne 'OK') {
        $Request
    } else {
        $Request.response
    }

}