---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#create-integration
schema: 2.0.0
---

# New-DuoIntegration

## SYNOPSIS
Create Integration

## SYNTAX

```
New-DuoIntegration [-Name] <String> [-Type] <String> [[-AdminApiAdmins] <Int32>] [[-AdminApiInfo] <Int32>]
 [[-AdminApiIntegrations] <Int32>] [[-AdminApiReadLog] <Int32>] [[-AdminApiReadResource] <Int32>]
 [[-AdminApiSettings] <Int32>] [[-AdminApiWriteResource] <Int32>] [[-Greeting] <String>]
 [[-GroupsAllowed] <String[]>] [[-NetworksForApiAccess] <String[]>] [[-Notes] <String>]
 [[-SelfServiceAllowed] <Int32>] [[-UsernameNormalizationPolicy] <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Create a new integration.
The new integration key and secret key are randomly generated and returned in the response.
Requires "Grant applications" API permission.

## EXAMPLES

### EXAMPLE 1
```
New-DuoIntegration -Type adminapi -AdminApiReadLog 1 -Name 'SIEM logging' -Notes 'This integration is for ingesting logs for SIEM'
```

## PARAMETERS

### -Name
The name of the integration to create.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
The type of the integration to create.
Refer to Retrieve Integrations for a list of valid values.
Note that integrations of type "azure-ca" (Microsoft Azure Active Directory) and all Duo Single Sign-On applications may not be created via the API.
If an integration has reached the Duo end of support then new instances of that integration may not be created with the API.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AdminApiAdmins
Set to 1 to grant an Admin API integration permission for all Admins methods.
Default: 0

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -AdminApiInfo
If creating an Admin API integration, set this to 1 to grant it permission for all Account Info methods.
Default: 0.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -AdminApiIntegrations
Set to 1 to grant an Admin API integration permission for all Integrations methods.
Default: 0.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -AdminApiReadLog
Set to 1 to grant an Admin API integration permission for all Logs methods.
Default: 0.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -AdminApiReadResource
Set to 1 to grant an Admin API integration permission to retrieve objects like users, phones, and hardware tokens.
Default: 0.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -AdminApiSettings
Set to 1 to grant an Admin API integration permission for all Settings methods.
Default: 0.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -AdminApiWriteResource
Set to 1 to grant an Admin API integration permission to create and modify objects like users, phones, and hardware tokens.
Default: 0.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Greeting
Voice greeting read before the authentication instructions to users who authenticate with a phone callback.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupsAllowed
A comma-separated list of group IDs that are allowed to authenticate with the integration.
If empty, all groups are allowed.

Object limits: 100 groups per integration.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NetworksForApiAccess
A comma-separated list of IP addresses, IP ranges, or CIDRs specifying the networks allowed to access this API integration.
Only applicable to Accounts API and Admin API integrations.
A given API integration may apply a network restriction to itself via API; use a different API integration to apply the network restriction, or edit the API application in the Duo Admin Panel GUI.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Notes
Description of the integration.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SelfServiceAllowed
Set to 1to grant an integration permission to allow users to manage their own devices.
This is only supported by integrations which allow for self service configuration.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -UsernameNormalizationPolicy
Policy for whether or not usernames should be altered before trying to match them to a user account.
Refer to Retrieve Integrations for a list of valid values.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://duo.com/docs/adminapi#create-integration](https://duo.com/docs/adminapi#create-integration)

