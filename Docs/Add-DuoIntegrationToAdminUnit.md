---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#add-group-to-administrative-unit
schema: 2.0.0
---

# Add-DuoIntegrationToAdminUnit

## SYNOPSIS
Add Integration to Administrative Unit

## SYNTAX

```
Add-DuoIntegrationToAdminUnit [-AdminUnitId] <String> [-IntegrationKey] <String> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Assign the integration with integration_key to the administrative unit with admin_unit_id.
Requires "Grant administrators" API permission.

## EXAMPLES

### EXAMPLE 1
```
Add-DuoIntegrationToAdminUnit -AdminUnitId SOMEADMINUNITID -IntegrationKey SOMEINTEGRATIONKEY
```

## PARAMETERS

### -AdminUnitId
The ID of the Administrative Unit

```yaml
Type: String
Parameter Sets: (All)
Aliases: admin_unit_id

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -IntegrationKey
The Key of the Integration

```yaml
Type: String
Parameter Sets: (All)
Aliases: integration_key

Required: True
Position: 2
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

## RELATED LINKS

[https://duo.com/docs/adminapi#add-group-to-administrative-unit](https://duo.com/docs/adminapi#add-group-to-administrative-unit)

