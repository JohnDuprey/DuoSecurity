---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-bypass-codes-by-user-id
schema: 2.0.0
---

# Get-DuoUserBypassCodes

## SYNOPSIS
Retrieve Bypass Codes by User ID

## SYNTAX

```
Get-DuoUserBypassCodes [-UserId] <String> [<CommonParameters>]
```

## DESCRIPTION
Returns a paged list of bypass code metadata associated with the user with ID user_id.
Does not return the actual bypass codes.
Requires "Grant read resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoUserBypassCodes -UserId SOMEUSERID
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://duo.com/docs/adminapi#retrieve-bypass-codes-by-user-id](https://duo.com/docs/adminapi#retrieve-bypass-codes-by-user-id)

