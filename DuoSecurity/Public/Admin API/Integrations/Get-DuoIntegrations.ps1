function Get-DuoIntegrations {
    <#
    .SYNOPSIS
    Retrieve Integrations

    .DESCRIPTION
    Returns a single integration or a paged list of integrations. Requires "Grant read resource" API permission.

    .PARAMETER IntegrationKey
    Integration Key to retrieve

    .EXAMPLE
    Get-DuoIntegrations

    .LINK
    https://duo.com/docs/adminapi#retrieve-integrations

    .LINK
    https://duo.com/docs/adminapi#retrieve-integration-by-integration-key

    #>
    [CmdletBinding()]
    Param(
        [Parameter()]
        [string]$IntegrationKey
    )

    if ($IntegrationKey) {
        $Path = '/admin/v1/integrations/{0}' -f $IntegrationKey
    } else {
        $Path = '/admin/v1/integrations'
    }

    $DuoRequest = @{
        Method = 'GET'
        Path   = $Path
    }

    $Response = Invoke-DuoRequest @DuoRequest
    if ($Response.stat -eq 'OK') {
        $Response.response
    } else {
        $Response
    }
}

Set-Alias -Name Get-DuoIntegration -Value Get-DuoIntegrations
