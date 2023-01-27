---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/accountsapi#get-edition
schema: 2.0.0
---

# Get-DuoAccountID

## SYNOPSIS
Get Account ID # from Duo API hostname

## SYNTAX

```
Get-DuoAccountID [[-ApiHost] <String>] [<CommonParameters>]
```

## DESCRIPTION
Converts hexidecimal hostname to decimal format

## EXAMPLES

### EXAMPLE 1
```
Get-DuoAccountID -ApiHost api-01ab23cd.duosecurity.com
```

## PARAMETERS

### -ApiHost
API hostname to get Account ID # for

```yaml
Type: String
Parameter Sets: (All)
Aliases: api_hostname

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
