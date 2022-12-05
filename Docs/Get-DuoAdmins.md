---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-administrators
schema: 2.0.0
---

# Get-DuoAdmins

## SYNOPSIS
Retrieve Administrators

## SYNTAX

```
Get-DuoAdmins [[-AdminId] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a single admin or a paged list of administrators.
Requires "Grant administrators" API permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoAdmins
```

## PARAMETERS

### -AdminId
The ID of the Adminstrator

```yaml
Type: String
Parameter Sets: (All)
Aliases: admin_id

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

[https://duo.com/docs/adminapi#retrieve-administrators](https://duo.com/docs/adminapi#retrieve-administrators)

