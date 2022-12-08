---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-administrative-units
schema: 2.0.0
---

# Get-DuoAdminUnits

## SYNOPSIS
Retrieve Administrative Units

## SYNTAX

```
Get-DuoAdminUnits [[-AdminUnitId] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a single administrative unit or a paged list of all administrative units if no parameters specified.
Requires "Grant administrators" API permission.

Optionally specify at most one parameter to return a list of administrative units associated with the given administrator, group, or integration.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoAdminUnits
```

## PARAMETERS

### -AdminUnitId
The ID of the Adminstrative Unit

```yaml
Type: String
Parameter Sets: (All)
Aliases: admin_unit_id

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

[https://duo.com/docs/adminapi#retrieve-administrative-units](https://duo.com/docs/adminapi#retrieve-administrative-units)

[https://duo.com/docs/adminapi#retrieve-administrative-unit-details](https://duo.com/docs/adminapi#retrieve-administrative-unit-details)

