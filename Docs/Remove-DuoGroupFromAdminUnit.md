---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#remove-integration-from-administrative-unit
schema: 2.0.0
---

# Remove-DuoGroupFromAdminUnit

## SYNOPSIS
Remove Integration from Administrative Unit

## SYNTAX

```
Remove-DuoGroupFromAdminUnit [-AdminUnitId] <String> [-IntegrationKey] <String> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Unassign the integration with admin_id from the administrative unit with admin_unit_id.
Requires "Grant administrators" API permission.

## EXAMPLES

### EXAMPLE 1
```
Remove-DuoIntegrationFromAdminUnit -AdminUnitId SOMEADMINUNITID -IntegrationKey SOMEINTEGRATIONKEY
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
Aliases: integration_Key

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

[https://duo.com/docs/adminapi#remove-integration-from-administrative-unit](https://duo.com/docs/adminapi#remove-integration-from-administrative-unit)

