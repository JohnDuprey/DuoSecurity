function Set-DuoApiAuth {
    <#
    .SYNOPSIS
    Sets credentials for Duo
    
    .DESCRIPTION
    Saves credentials as script scoped variables for use in the module
    
    .PARAMETER ApiHost
    Hostname (excluding https:\\)
    
    .PARAMETER IntegrationKey
    Integration key
    
    .PARAMETER SecretKey
    Secret key
    
    .PARAMETER Type
    Type of credential
    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('api_hostname')]
        $ApiHost,

        [Parameter(ValueFromPipelineByPropertyName=$true, Mandatory = $true)]
        [Alias('integration_key')]
        $IntegrationKey,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('secret_key')]
        $SecretKey,

        [ValidateSet('Accounts', 'Admin', 'Auth')]
        [string]$Type = 'Admin'
    )
    process {
        switch ($Type) {
            'Accounts' {
                $script:DuoAccountsApiHost = $ApiHost
                $script:DuoAccountsIntegrationKey = $IntegrationKey
                $script:DuoAccountsSecretKey = $SecretKey
            }
            'Admin' {
                $script:DuoApiHost = $ApiHost
                $script:DuoIntegrationKey = $IntegrationKey
                $script:DuoSecretKey = $SecretKey
            }
            'Auth' {
                $script:DuoAuthApiHost = $ApiHost
                $script:DuoAuthIntegrationKey = $IntegrationKey
                $script:DuoAuthSecretKey = $SecretKey
            }
        }
    }
}
