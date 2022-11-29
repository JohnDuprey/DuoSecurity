function Remove-DuoIntegration {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('integration_key')]
        [string]$IntegrationKey
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/integrations/{0}' -f $IntegrationKey
        }
        if ($PSCmdlet.ShouldProcess($IntegrationKey)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
