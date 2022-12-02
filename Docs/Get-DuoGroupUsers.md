---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version:
schema: 2.0.0
---

# Get-DuoGroupUsers

## SYNOPSIS
Retrieve Group Members

## SYNTAX

```
Get-DuoGroupUsers [-GroupId] <String> [<CommonParameters>]
```

## DESCRIPTION
Returns a paged list of members of a specified group.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoGroupUsers -GroupId SOMEDUOID
```

## PARAMETERS

### -GroupId
Group Id to get member list for

```yaml
Type: String
Parameter Sets: (All)
Aliases: group_id

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
