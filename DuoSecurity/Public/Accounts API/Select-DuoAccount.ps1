function Select-DuoAccount {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true, ParameterSetName = 'AccountId')]
        [string]$AccountId,
        
        [Parameter(Mandatory = $true, ParameterSetName = 'AccountName')]
        [string]$Name,

        [Parameter(ParameterSetName = 'Clear')]
        [switch]$Clear,

        [switch]$Quiet
    )
    
    if ($Clear) { 
        $script:DuoApiHost = $script:DuoAccountsApiHost
        $script:DuoAccountId = $null
    }

    if (!$script:DuoAccountsList) {
        Get-DuoAccounts | Out-Null
    }

    if ($Name) {
        $Account = $script:DuoAccountsList | Where-Object { $_.name -eq $Name }
    }

    if ($AccountId) {
        $Account = $script:DuoAccountsList | Where-Object { $_.account_id -eq $AccountId }
    }

    if ($Account) {
        $script:DuoApiHost = $Account.api_hostname
        $script:DuoIntegrationKey = $script:DuoAccountsIntegrationKey
        $script:DuoSecretKey = $script:DuoAccountsSecretKey
        $script:DuoAccountId = $Account.account_id
        if (!$Quiet) {
            Write-Host "Account: $($Account.name) ($($Account.account_id))" 
        }
    }
}