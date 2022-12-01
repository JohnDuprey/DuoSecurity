# DuoSecurity Module

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
- [ ] [Auth API](https://duo.com/docs/authapi)

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

