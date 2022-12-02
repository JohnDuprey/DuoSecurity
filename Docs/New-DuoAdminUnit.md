---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#create-activation-link-for-administrator-pending-activation
schema: 2.0.0
---

# New-DuoAdminUnit

## SYNOPSIS
Add Administrative Unit

## SYNTAX

```
New-DuoAdminUnit [-Name] <String> [-Description] <String> [-RestrictByGroups] [-RestrictByIntegrations]
 [[-Admins] <String[]>] [[-Groups] <String[]>] [[-Integrations] <String[]>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Add a new administrative unit with specified administrators, groups, or other parameters.
Requires "Grant administrators" API permission.

## EXAMPLES

### EXAMPLE 1
```
New-DuoAdminUnit -Name 'Accounts Payable Admins' -RestrictByGroups -Groups 'ACCTSPAYABLEGROUPID'
```

## PARAMETERS

### -Name
The name of the new administrative unit.
Must be unique amongst all administrative units.

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

### -Description
A description of the new administrative unit.

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

### -RestrictByGroups
Does the new administrative unit specify groups?
Default: false.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -RestrictByIntegrations
Does the new administrative unit specify integrations?
Default: false.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Admins
One or more admin_id values to assign administrators to the new administrative unit.
The administrator user must have restricted_by_admin_units set to true before attempting to assign them to an administrative unit via the API.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Groups
One or more group_id values to assign groups to the new administrative unit.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Integrations
One or more integration_key values to assign integrations to the new administrative unit.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
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
