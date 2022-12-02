---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-users
schema: 2.0.0
---

# Send-DuoAdminActivationEmail

## SYNOPSIS
Email Activation Link to Administrator Pending Activation

## SYNTAX

```
Send-DuoAdminActivationEmail [-AdminId] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Email the current activation link to the administrator pending activation with the administrator ID admin_id.
Requires "Grant administrators" API permission.

## EXAMPLES

### EXAMPLE 1
```
Send-DuoAdminActivationEmail -AdminId SOMEADMINID
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
