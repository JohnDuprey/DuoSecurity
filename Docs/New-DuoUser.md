---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#create-user
schema: 2.0.0
---

# New-DuoUser

## SYNOPSIS
Create User

## SYNTAX

```
New-DuoUser [-Username] <String> [[-Aliases] <Hashtable>] [[-FullName] <String>] [[-Email] <String>]
 [[-Status] <String>] [[-Notes] <String>] [[-FirstName] <String>] [[-LastName] <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Create a new user with the specified username.
Requires "Grant write resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
New-DuoUser -Username bob -Aliases @{alias1='bobby'; alias2='robert'} -Status Active
```

## PARAMETERS

### -Username
The name of the user to create.

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

### -Aliases
Username aliases for the user.
Up to eight aliases may be specified with this parameter as a set of URL-encoded key-value pairs e.g.
alias1=joe.smith&alias2=jsmith@example.com.
Ignores alias position values not specified.
Aliases must be unique amongst users.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: @{}
Accept pipeline input: False
Accept wildcard characters: False
```

### -FullName
The real name (or full name) of this user.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Email
The email address of this user.

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

### -Status
The user's status.
One of:

Status	    Description
------      -----------
"active"	The user must complete secondary authentication.
This is the default value if no status is specified.
"bypass"	The user will bypass secondary authentication after completing primary authentication.
"disabled"	The user will not be able to complete secondary authentication.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: Active
Accept pipeline input: False
Accept wildcard characters: False
```

### -Notes
An optional description or notes field.
Can be viewed in the Duo Admin Panel.

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

### -FirstName
The user's given name.

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

### -LastName
The user's surname.

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

[https://duo.com/docs/adminapi#create-user](https://duo.com/docs/adminapi#create-user)

