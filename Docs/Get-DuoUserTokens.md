---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-users
schema: 2.0.0
---

# Get-DuoUserTokens

## SYNOPSIS
Retrieve Hardware Tokens by User ID

## SYNTAX

```
Get-DuoUserTokens [-UserId] <String> [<CommonParameters>]
```

## DESCRIPTION
Returns a paged list of OTP hardware tokens associated with the user with ID user_id.
To fetch all results, call repeatedly with the offset parameter as long as the result metadata has a next_offset value.
Requires "Grant read resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoUserTokens -UserId SOMEUSERID
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
