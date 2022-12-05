---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-bypass-codes
schema: 2.0.0
---

# Get-DuoBypassCodes

## SYNOPSIS
Retrieve Bypass Codes

## SYNTAX

```
Get-DuoBypassCodes [[-BypassCodeId] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns information about a single bypass code or a paged list of information about all bypass codes.
Output does not include the actual bypass codes.
Requires "Grant read resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoBypassCodes
```

## PARAMETERS

### -BypassCodeId
Bypass Code Id to retrieve

```yaml
Type: String
Parameter Sets: (All)
Aliases: bypass_code_id

Required: False
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

[https://duo.com/docs/adminapi#retrieve-bypass-codes](https://duo.com/docs/adminapi#retrieve-bypass-codes)

[https://duo.com/docs/adminapi#retrieve-bypass-code-by-id](https://duo.com/docs/adminapi#retrieve-bypass-code-by-id)

