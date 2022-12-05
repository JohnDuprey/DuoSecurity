---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-admin-external-password-management-status
schema: 2.0.0
---

# Get-DuoAdminPasswordManagement

## SYNOPSIS
Retrieve Admin External Password Management Status

## SYNTAX

```
Get-DuoAdminPasswordManagement [[-AdminId] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a paged list of administrators indicating whether they have been configured for external password management.
Requires "Grant administrators" API permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoAdminPasswordManagement
```

## PARAMETERS

### -AdminId
{{ Fill AdminId Description }}

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

[https://duo.com/docs/adminapi#retrieve-admin-external-password-management-status](https://duo.com/docs/adminapi#retrieve-admin-external-password-management-status)

