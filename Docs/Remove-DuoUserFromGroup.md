---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#disassociate-group-from-user
schema: 2.0.0
---

# Remove-DuoUserFromGroup

## SYNOPSIS
Disassociate Group from User

## SYNTAX

```
Remove-DuoUserFromGroup [-UserId] <String> [-GroupId] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Disassociate a group from the user with ID user_id.
This method will return 200 if the group was found or if no such group exists.
Requires "Grant write resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
Remove-DuoUserFromGroup -UserId SOMEUSERID -GroupId SOMEGROUPID
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

### -GroupId
The ID of the Group

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

[https://duo.com/docs/adminapi#disassociate-group-from-user](https://duo.com/docs/adminapi#disassociate-group-from-user)

