---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#associate-group-with-user
schema: 2.0.0
---

# Add-DuoUserToGroup

## SYNOPSIS
Associate Group with User

## SYNTAX

```
Add-DuoUserToGroup [-UserId] <String> [-GroupId] <String> [<CommonParameters>]
```

## DESCRIPTION
Associate a group with ID group_id with the user with ID user_id.
Requires "Grant write resource" API permission.

Object limits: 100 groups per user.

## EXAMPLES

### EXAMPLE 1
```
Add-DuoUserToGroup -UserId SOMEUSERID -GroupId SOMEGROUPID
```

## PARAMETERS

### -UserId
The ID of the user

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
The ID of the group to associate with the user.

```yaml
Type: String
Parameter Sets: (All)
Aliases: group_id

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://duo.com/docs/adminapi#associate-group-with-user](https://duo.com/docs/adminapi#associate-group-with-user)

