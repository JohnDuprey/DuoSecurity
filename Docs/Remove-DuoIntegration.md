---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-users
schema: 2.0.0
---

# Remove-DuoIntegration

## SYNOPSIS
Delete Integration

## SYNTAX

```
Remove-DuoIntegration [-IntegrationKey] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Delete the integration with integration_key from the system.
Attempting to delete the Admin API integration whose secret key is used to sign this request will return an error.
Requires "Grant applications" API permission.

## EXAMPLES

### EXAMPLE 1
```
Remove-DuoIntegration -IntegrationKey SOMEDUOKEY
```

## PARAMETERS

### -IntegrationKey
Integration key to remove

```yaml
Type: String
Parameter Sets: (All)
Aliases: integration_key

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
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
WARNING: Deleting an integration from Duo can block user logins!

Be sure to remove Duo authentication from your product's configuration before you delete the corresponding integration.

Depending on the application this could mean uninstalling Duo software from your systems, or updating your device or application settings to no longer include Duo in the authentication process.

There is no way to restore an integration deleted in error with Admin API.

## RELATED LINKS
