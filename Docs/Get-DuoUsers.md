---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-users
schema: 2.0.0
---

# Get-DuoUsers

## SYNOPSIS
Retrieve Users

## SYNTAX

### List (Default)
```
Get-DuoUsers [-Username <String>] [<CommonParameters>]
```

### Single
```
Get-DuoUsers -UserId <String> [<CommonParameters>]
```

## DESCRIPTION
Returns a single user or a paged list of users.
If username is not provided, the list will contain all users.
If username is provided, the list will either contain a single user (if a match was found) or no users.
Requires "Grant read resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoUser -Username bob
```

## PARAMETERS

### -UserId
Specify a user id

```yaml
Type: String
Parameter Sets: Single
Aliases: user_id

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Username
Specify a user name (or username alias) to look up a single user.

```yaml
Type: String
Parameter Sets: List
Aliases:

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

[https://duo.com/docs/adminapi#retrieve-users](https://duo.com/docs/adminapi#retrieve-users)

