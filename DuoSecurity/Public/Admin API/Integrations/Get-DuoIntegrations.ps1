function Get-DuoIntegrations {
    [CmdletBinding()]
    Param(
        [string]$IntegrationKey
    )

    if ($IntegrationKey) {
        $Path = '/admin/v1/integrations/{0}' -f $IntegrationKey
    }
    else {
        $Path = '/admin/v1/integrations'
    }

    $DuoRequest = @{
        Method = 'GET'
        Path   = $Path
    }

    $Response = Invoke-DuoRequest @DuoRequest
    if ($Response.stat -eq 'OK') {
        $Response.response
    }
    else {
        $Response
    }
} 

Set-Alias -Name Get-DuoIntegration -Value Get-DuoIntegrations
