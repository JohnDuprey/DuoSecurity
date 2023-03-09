# DuoSecurity Module
[![DuoSecurityDownloads]][DuoSecurityGallery] ![DuoSecurityBuild] ![DuoSecurityPublish]

<!-- References -->
[DuoSecurityDownloads]: https://img.shields.io/powershellgallery/dt/DuoSecurity
[DuoSecurityGallery]: https://www.powershellgallery.com/packages/DuoSecurity/
[DuoSecurityBuild]: https://img.shields.io/github/actions/workflow/status/johnduprey/DuoSecurity/psscriptanalyzer.yml?branch=main&label=PSScriptAnalyzer
[DuoSecurityPublish]: https://img.shields.io/github/actions/workflow/status/johnduprey/DuoSecurity/psscriptanalyzer.yml?label=PSGallery

This module interacts with the Duo APIs.

# Instructions

### Prerequisites

- PowerShell 7 or later
- Duo MFA license or higher

#### Module Installation ([PowerShell Gallery](https://www.powershellgallery.com/packages/DuoSecurity))

```powershell
Install-Module DuoSecurity
```

### Supported Duo APIs

- [X] [Accounts API](https://duo.com/docs/accountsapi)
- [X] [Admin API](https://duo.com/docs/adminapi)
- [X] [Auth API](https://duo.com/docs/authapi)

# Examples

### Accounts API
```powershell
Import-Module DuoSecurity

# Accounts API Credentials (MSP only)
$Auth = @{
    Type           = 'Accounts'
    IntegrationKey = 'DUO_INTEGRATION_KEY'
    SecretKey      = 'DUO_SECRET_KEY'
    ApiHost        = 'api-xxxxxxxx.duosecurity.com'
}
Set-DuoApiAuth @Auth

# Retrieve list of Duo child accounts
Get-DuoAccounts

# Select account to use for Admin API queries
Select-DuoAccount -Name 'Your child account name'

# Retrieve user list
Get-DuoUsers
```

### Admin API
```powershell
Import-Module DuoSecurity

# Admin API credentials
$Auth = @{
    Type           = 'Admin'
    IntegrationKey = 'DUO_INTEGRATION_KEY'
    SecretKey      = 'DUO_SECRET_KEY'
    ApiHost        = 'api-xxxxxxxx.duosecurity.com'
}
Set-DuoApiAuth @Auth

# Retrieve user list
Get-DuoUsers
```

# Cmdlet Help
## Accounts API
- [Get-DuoAccountEdition](./Docs/Get-DuoAccountEdition.md)
- [Get-DuoAccounts](./Docs/Get-DuoAccounts.md)
- [Get-DuoAccountTelephonyCredits](./Docs/Get-DuoAccountTelephonyCredits.md)
- [New-DuoAccount](./Docs/New-DuoAccount.md)
- [Remove-DuoAccount](./Docs/Remove-DuoAccount.md)
- [Select-DuoAccount](./Docs/Select-DuoAccount.md)
- [Set-DuoAccountEdition](./Docs/Set-DuoAccountEdition.md)
- [Set-DuoAccountTelephonyCredits](./Docs/Set-DuoAccountTelephonyCredits.md)
## Admin API
- Administrative Units
  - [Add-DuoAdminToAdminUnit](./Docs/Add-DuoAdminToAdminUnit.md)
  - [Add-DuoGroupToAdminUnit](./Docs/Add-DuoGroupToAdminUnit.md)
  - [Add-DuoIntegrationToAdminUnit](./Docs/Add-DuoIntegrationToAdminUnit.md)
  - [Get-DuoAdminUnits](./Docs/Get-DuoAdminUnits.md)
  - [New-DuoAdminUnit](./Docs/New-DuoAdminUnit.md)
  - [Remove-DuoAdminFromAdminUnit](./Docs/Remove-DuoAdminFromAdminUnit.md)
  - [Remove-DuoGroup](./Docs/Remove-DuoGroup.md)
  - [Remove-DuoGroupFromAdminUnit](./Docs/Remove-DuoGroupFromAdminUnit.md)
  - [Remove-DuoIntegrationFromAdminUnit](./Docs/Remove-DuoIntegrationFromAdminUnit.md)
  - [Update-DuoAdminUnit](./Docs/Update-DuoAdminUnit.md)
- Administrators
  - [Clear-DuoAdminInactivity](./Docs/Clear-DuoAdminInactivity.md)
  - [Get-DuoAdminActivations](./Docs/Get-DuoAdminActivations.md)
  - [Get-DuoAdminAuthFactors](./Docs/Get-DuoAdminAuthFactors.md)
  - [Get-DuoAdminPasswordManagement](./Docs/Get-DuoAdminPasswordManagement.md)
  - [Get-DuoAdmins](./Docs/Get-DuoAdmins.md)
  - [New-DuoAdmin](./Docs/New-DuoAdmin.md)
  - [New-DuoAdminActivation](./Docs/New-DuoAdminActivation.md)
  - [New-DuoAdminActivationLink](./Docs/New-DuoAdminActivationLink.md)
  - [Remove-DuoAdmin](./Docs/Remove-DuoAdmin.md)
  - [Remove-DuoAdminActivation](./Docs/Remove-DuoAdminActivation.md)
  - [Remove-DuoAdminActivationLink](./Docs/Remove-DuoAdminActivationLink.md)
  - [Reset-DuoAdminAuthAttempts](./Docs/Reset-DuoAdminAuthAttempts.md)
  - [Send-DuoAdminActivationEmail](./Docs/Send-DuoAdminActivationEmail.md)
  - [Set-DuoAdminAuthFactors](./Docs/Set-DuoAdminAuthFactors.md)
  - [Sync-DuoAdminFromDirectory](./Docs/Sync-DuoAdminFromDirectory.md)
  - [Update-DuoAdmin](./Docs/Update-DuoAdmin.md)
- Bypass Codes
  - [Get-DuoBypassCodes](./Docs/Get-DuoBypassCodes.md)
  - [Remove-DuoBypassCode](./Docs/Remove-DuoBypassCode.md)
- Custom Branding
  - [Add-DuoCustomBrandingDraftUser](./Docs/Add-DuoCustomBrandingDraftUser.md)
  - [Get-DuoCustomBranding](./Docs/Get-DuoCustomBranding.md)
  - [Get-DuoCustomMessaging](./Docs/Get-DuoCustomMessaging.md)
  - [Publish-DuoCustomBranding](./Docs/Publish-DuoCustomBranding.md)
  - [Remove-DuoCustomBrandingDraftUser](./Docs/Remove-DuoCustomBrandingDraftUser.md)
  - [Set-DuoCustomBranding](./Docs/Set-DuoCustomBranding.md)
  - [Set-DuoCustomMessaging](./Docs/Set-DuoCustomMessaging.md)
- Endpoints
  - [Get-DuoEndpoints](./Docs/Get-DuoEndpoints.md)
- Groups
  - [Get-DuoGroups](./Docs/Get-DuoGroups.md)
  - [Get-DuoGroupUsers](./Docs/Get-DuoGroupUsers.md)
  - [New-DuoGroup](./Docs/New-DuoGroup.md)
  - [Remove-DuoGroup](./Docs/Remove-DuoGroup.md)
  - [Update-DuoGroup](./Docs/Update-DuoGroup.md)
- Info
  - [Get-DuoAccountSummary](./Docs/Get-DuoAccountSummary.md)
  - [Get-DuoAuthenticationAttempts](./Docs/Get-DuoAuthenticationAttempts.md)
  - [Get-DuoTelephonyCreditsUsed](./Docs/Get-DuoTelephonyCreditsUsed.md)
  - [Get-DuoUserAuthenticationAttempts](./Docs/Get-DuoUserAuthenticationAttempts.md)
- Integrations
  - [Get-DuoIntegrations](./Docs/Get-DuoIntegrations.md)
  - [New-DuoIntegration](./Docs/New-DuoIntegration.md)
  - [Remove-DuoIntegration](./Docs/Remove-DuoIntegration.md)
  - [Update-DuoIntegration](./Docs/Update-DuoIntegration.md)
- Logs
  - [Get-DuoAdminLogs](./Docs/Get-DuoAdminLogs.md)
  - [Get-DuoAuthLogs](./Docs/Get-DuoAuthLogs.md)
  - [Get-DuoOfflineEnrollmentLogs](./Docs/Get-DuoOfflineEnrollmentLogs.md)
  - [Get-DuoTelephonyLogs](./Docs/Get-DuoTelephonyLogs.md)
- Phones
  - [Get-DuoPhones](./Docs/Get-DuoPhones.md)
  - [New-DuoPhone](./Docs/New-DuoPhone.md)
  - [New-DuoPhoneActivationCode](./Docs/New-DuoPhoneActivationCode.md)
  - [Remove-DuoPhone](./Docs/Remove-DuoPhone.md)
  - [Send-DuoPhoneActivationSms](./Docs/Send-DuoPhoneActivationSms.md)
  - [Send-DuoPhoneInstallationSms](./Docs/Send-DuoPhoneInstallationSms.md)
  - [Send-DuoPhoneSmsPasscodes](./Docs/Send-DuoPhoneSmsPasscodes.md)
  - [Update-DuoPhone](./Docs/Update-DuoPhone.md)
- Settings
  - [Get-DuoSettings](./Docs/Get-DuoSettings.md)
  - [Update-DuoSettings](./Docs/Update-DuoSettings.md)
- Tokens
  - [Get-DuoTokens](./Docs/Get-DuoTokens.md)
  - [New-DuoToken](./Docs/New-DuoToken.md)
  - [Remove-DuoToken](./Docs/Remove-DuoToken.md)
  - [Sync-DuoToken](./Docs/Sync-DuoToken.md)
- Trust Monitor
  - [Get-DuoTrustMonitorEvents](./Docs/Get-DuoTrustMonitorEvents.md)
- Users
  - [Add-DuoUserPhone](./Docs/Add-DuoUserPhone.md)
  - [Add-DuoUserToGroup](./Docs/Add-DuoUserToGroup.md)
  - [Add-DuoUserToken](./Docs/Add-DuoUserToken.md)
  - [Get-DuoUserBypassCodes](./Docs/Get-DuoUserBypassCodes.md)
  - [Get-DuoUserGroups](./Docs/Get-DuoUserGroups.md)
  - [Get-DuoUserPhones](./Docs/Get-DuoUserPhones.md)
  - [Get-DuoUsers](./Docs/Get-DuoUsers.md)
  - [Get-DuoUserTokens](./Docs/Get-DuoUserTokens.md)
  - [Get-DuoUserWebAuthnCredentials](./Docs/Get-DuoUserWebAuthnCredentials.md)
  - [New-DuoUser](./Docs/New-DuoUser.md)
  - [New-DuoUserBypassCodes](./Docs/New-DuoUserBypassCodes.md)
  - [Register-DuoUser](./Docs/Register-DuoUser.md)
  - [Remove-DuoUser](./Docs/Remove-DuoUser.md)
  - [Remove-DuoUserFromGroup](./Docs/Remove-DuoUserFromGroup.md)
  - [Remove-DuoUserPhone](./Docs/Remove-DuoUserPhone.md)
  - [Remove-DuoUserToken](./Docs/Remove-DuoUserToken.md)
  - [Sync-DuoUserFromDirectory](./Docs/Sync-DuoUserFromDirectory.md)
  - [Update-DuoUser](./Docs/Update-DuoUser.md)
- WebAuthn
  - [Get-DuoWebAuthnCredentials](./Docs/Get-DuoWebAuthnCredentials.md)
  - [Remove-DuoWebAuthnCredential](./Docs/Remove-DuoWebAuthnCredential.md)
## Apps
- Authentication Proxy
  - [Get-DuoAuthProxyLogs](./Docs/Get-DuoAuthProxyLogs.md)
- Install & Upgrade
  - [Get-DuoInstallFileInfo](./Docs/Get-DuoInstallFileInfo.md)
  - [Install-DuoAuthProxy](./Docs/Install-DuoAuthProxy.md)
## Auth API
- [Get-DuoAuthEnrollmentStatus](./Docs/Get-DuoAuthEnrollmentStatus.md)
- [Get-DuoAuthLogo](./Docs/Get-DuoAuthLogo.md)
- [Get-DuoAuthStatus](./Docs/Get-DuoAuthStatus.md)
- [New-DuoAuthEnrollment](./Docs/New-DuoAuthEnrollment.md)
- [Send-DuoAuth](./Docs/Send-DuoAuth.md)
- [Send-DuoAuthPing](./Docs/Send-DuoAuthPing.md)
- [Send-DuoPreAuth](./Docs/Send-DuoPreAuth.md)
- [Test-DuoAuthApi](./Docs/Test-DuoAuthApi.md)
## Authentication
- [Set-DuoApiAuth](./Docs/Set-DuoApiAuth.md)
## Misc
- [Get-DuoAccountID](./Docs/Get-DuoAccountID.md)
- [New-DuoTokenTotpSecret](./Docs/New-DuoTokenTotpSecret.md)
