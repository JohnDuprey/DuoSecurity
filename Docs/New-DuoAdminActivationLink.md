---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#create-activation-link-for-administrator-pending-activation
schema: 2.0.0
---

# New-DuoAdminActivationLink

## SYNOPSIS
Create Activation Link for Administrator Pending Activation

## SYNTAX

```
New-DuoAdminActivationLink [-AdminId] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Creates an activation link for the administrator pending activation with the administrator ID admin_id.
There must not already be an existing activation link for the admin.
Requires "Grant administrators" API permission.

## EXAMPLES

### EXAMPLE 1
```
New-DuoAdminActivationLink -AdminId SOMEADMINID
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

[https://duo.com/docs/adminapi#create-activation-link-for-administrator-pending-activation](https://duo.com/docs/adminapi#create-activation-link-for-administrator-pending-activation)

