---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-users
schema: 2.0.0
---

# Update-DuoIntegration

## SYNOPSIS
Modify Integration

## SYNTAX

```
Update-DuoIntegration [-IntegrationKey] <String> [[-Name] <String>] [[-AdminApiAdmins] <Int32>]
 [[-AdminApiInfo] <Int32>] [[-AdminApiIntegrations] <Int32>] [[-AdminApiReadLog] <Int32>]
 [[-AdminApiReadResource] <Int32>] [[-AdminApiSettings] <Int32>] [[-AdminApiWriteResource] <Int32>]
 [[-Greeting] <String>] [[-GroupsAllowed] <String[]>] [[-NetworksForApiAccess] <String[]>] [[-Notes] <String>]
 [[-PolicyKey] <String>] [[-PromptV4Enabled] <Int32>] [[-ResetSecretKey] <Int32>]
 [[-SelfServiceAllowed] <Int32>] [[-UsernameNormalizationPolicy] <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Change the name, enrollment policy, greeting, and/or notes of the integration with integration key integration_key, or reset its secret key.
When modifying an Admin API integration permissions can also be added or removed.
Requires "Grant applications" API permission.

## EXAMPLES

### EXAMPLE 1
```
Update-DuoIntegration -IntegrationKey SOMEDUOKEY -Greeting 'Welcome to Duo.'
```

## PARAMETERS

### -IntegrationKey
Integration key to update

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

### -Name
New name for the integration.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AdminApiAdmins
Set to 1 to grant an Admin API integration permission for all Admins methods or 0 to remove access to them.

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
Set to 1 to grant an Admin API integration permission for all Account Info methods or 0 to remove access to them.

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
Set to 1 to grant an Admin API integration permission for all Integrations methods or 0 to remove access to them.

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
Set to 1 to grant an Admin API integration permission for all Logs methods or 0 to remove access to them.

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
Set to 1 to grant an Admin API integration permission to retrieve objects like users, phones, and hardware tokens or 0 to remove access to them.

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
Set to 1 to grant an Admin API integration permission for all Settings methods or 0 to remove access to them.

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
Set to 1to grant an Admin API integration permission to create and modify objects like users, phones, and hardware tokens or 0 to remove access to them.

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
New voice greeting.
Will be read before the authentication instructions to users who authenticate with a phone callback.

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
If set to an empty string, all groups will be allowed.

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
New description of the integration.

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

### -PolicyKey
Specify the "Policy Key" value for a custom policy to attach it to the specified integration.
Obtain a policy's key by viewing it in the Duo Admin Panel's "Policies" page or from the output of Retrieve Integrations.
Leave the value blank to detach the currently attached policy from an integration.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PromptV4Enabled
Set to 1 to activate Duo Universal Prompt for the application, or to 0 to revert back to traditional prompt.
Only appears for a given integration when frameless_auth_prompt_enabled is 1 (value set automatically when Duo detects a frameless authentication for the integration).

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResetSecretKey
If set to 1, resets the integration's secret key to a new, randomly generated value.
The new secret key is returned in the return value.
Attempting to reset the secret key for the same Admin API integration whose integration key and secret key are used to make this call will return an error.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SelfServiceAllowed
Set to 1 to grant an integration permission to allow users to manage their own devices.
This is only supported by integrations which allow for self service configuration.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -UsernameNormalizationPolicy
New policy for whether or not usernames should be altered before trying to match them to a user account.
Refer to Retrieve Integrations for a list of valid values.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 18
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
General notes

## RELATED LINKS
