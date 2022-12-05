---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-phones-by-user-id
schema: 2.0.0
---

# Get-DuoUserPhones

## SYNOPSIS
Retrieve Phones by User ID

## SYNTAX

```
Get-DuoUserPhones [-UserId] <String> [<CommonParameters>]
```

## DESCRIPTION
Returns a paged list of phones associated with the user with ID user_id.
Requires "Grant read resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoUserPhones -UserId SOMEUSERID
```

## PARAMETERS

### -UserId
THe ID of the user

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

[https://duo.com/docs/adminapi#retrieve-phones-by-user-id](https://duo.com/docs/adminapi#retrieve-phones-by-user-id)

