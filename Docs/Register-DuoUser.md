---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#enroll-user
schema: 2.0.0
---

# Register-DuoUser

## SYNOPSIS
Enroll User

## SYNTAX

```
Register-DuoUser [-Username] <String> [-Email] <String> [[-ValidSecs] <Int32>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Enroll a user with user name username and email address email and send them an enrollment email that expires after valid_secs seconds.
Requires "Grant write resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
Register-DuoUser -Username 'bill' -Email 'bill.lumbergh@initech.com'
```

## PARAMETERS

### -Username
The user name (or username alias) of the user to enroll.

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

### -Email
The email address of this user.

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

### -ValidSecs
The number of seconds the enrollment code should remain valid.
Default: 2592000 (30 days).

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 2592000
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

[https://duo.com/docs/adminapi#enroll-user](https://duo.com/docs/adminapi#enroll-user)

