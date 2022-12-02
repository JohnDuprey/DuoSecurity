function Remove-DuoIntegration {
    <#
    .SYNOPSIS
    Delete Integration
    
    .DESCRIPTION
    Delete the integration with integration_key from the system. Attempting to delete the Admin API integration whose secret key is used to sign this request will return an error. Requires "Grant applications" API permission.
    
    .PARAMETER IntegrationKey
    Integration key to remove
    
    .EXAMPLE
    Remove-DuoIntegration -IntegrationKey SOMEDUOKEY

    .LINK
    https://duo.com/docs/adminapi#delete-integration

    .NOTES
    WARNING: Deleting an integration from Duo can block user logins!
    
    Be sure to remove Duo authentication from your product's configuration before you delete the corresponding integration.

    Depending on the application this could mean uninstalling Duo software from your systems, or updating your device or application settings to no longer include Duo in the authentication process.

    There is no way to restore an integration deleted in error with Admin API.
    #>
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
