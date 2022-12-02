---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version:
schema: 2.0.0
---

# Get-DuoUserGroups

## SYNOPSIS
Retrieve Groups by User ID

## SYNTAX

```
Get-DuoUserGroups [-UserId] <String> [<CommonParameters>]
```

## DESCRIPTION
Returns a paged list of groups associated with the user with ID user_id.
Requires "Grant read resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoUserGroups -UserId SOME USERID
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
