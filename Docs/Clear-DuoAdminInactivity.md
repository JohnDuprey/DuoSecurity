---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version:
schema: 2.0.0
---

# Clear-DuoAdminInactivity

## SYNOPSIS
Clear Administrator Expiration

## SYNTAX

```
Clear-DuoAdminInactivity [-AdminId] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Clear expiration for the administrator with admin_id after the admin has been expired due to inactivity.
The administrator's status changes from "Expired" to the status applied to that admin before inactive expiration, and restores access to the Duo Admin Panel if the effective status is "Active".
Requires "Grant administrators" API permission.

## EXAMPLES

### EXAMPLE 1
```
Clear-DuoAdminInactivity -AdminId SOMEADMINID
```

## PARAMETERS

### -AdminId
The ID of the Administrator

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
