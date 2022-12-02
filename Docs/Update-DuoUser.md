---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#modify-user
schema: 2.0.0
---

# Update-DuoUser

## SYNOPSIS
Modify User

## SYNTAX

```
Update-DuoUser [-UserId] <String> [[-Username] <String>] [[-Aliases] <String[]>] [[-FullName] <String>]
 [[-Email] <String>] [[-Status] <String>] [[-Notes] <String>] [[-FirstName] <String>] [[-LastName] <String>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Change the username, username aliases, full name, status, and/or notes section of the user with ID user_id.
Requires "Grant write resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
Update-DuoUser -UserId SOMEUSERID -Status Disabled
```

## PARAMETERS

### -UserId
The ID of the User

```yaml
Type: String
Parameter Sets: (All)
Aliases: user_id

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Username
The new username.

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

### -Aliases
Username aliases for the user.
Up to eight aliases may be specified with this parameter as a set of URL-encoded key-value pairs e.g.
alias1=joe.smith&alias2=jsmith@example.com.
Ignores alias position values not specified.
Remove the value for an existing alias by specifying a blank value e.g.
alias1=.
Aliases must be unique amongst users.

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

### -FullName
The new real name (or full name).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Email
The new email address.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Status
The new status.
Must be one of "active", "disabled", or "bypass".
See Retrieve Users for an explanation of these fields.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Notes
The new notes field.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FirstName
The user's new given name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LastName
The user's new surname.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
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

[https://duo.com/docs/adminapi#modify-user](https://duo.com/docs/adminapi#modify-user)

