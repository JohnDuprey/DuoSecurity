---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#add-administrator-to-administrative-unit
schema: 2.0.0
---

# Add-DuoAdminToAdminUnit

## SYNOPSIS
Add Administrator to Administrative Unit

## SYNTAX

```
Add-DuoAdminToAdminUnit [-AdminUnitId] <String> [-AdminId] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Assign the administrator with admin_id to the administrative unit with admin_unit_id.
The administrator user must have restricted_by_admin_units set to true before attempting to assign them to an administrative unit via the API.
Requires "Grant administrators" API permission.

## EXAMPLES

### EXAMPLE 1
```
Add-DuoAdminToAdminUnit -AdminUnitId SOMEADMINUNITID -AdminId SOMEADMINID
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

### -AdminId
The ID of the Administrator

```yaml
Type: String
Parameter Sets: (All)
Aliases: admin_id

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
Object limits: 100 groups per user.

## RELATED LINKS

[https://duo.com/docs/adminapi#add-administrator-to-administrative-unit](https://duo.com/docs/adminapi#add-administrator-to-administrative-unit)

