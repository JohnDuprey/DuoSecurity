---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/authapi#/logo
schema: 2.0.0
---

# Get-DuoAuthProxyLogs

## SYNOPSIS
This script reads Duo Auth Proxy log files

## SYNTAX

### List
```
Get-DuoAuthProxyLogs [-ListLogs] [<CommonParameters>]
```

### Logs
```
Get-DuoAuthProxyLogs [-LogName <String>] [-Search <String>] [<CommonParameters>]
```

## DESCRIPTION
Reads in log files from the designated log path and parses the entries from the standard log file format or json in the case of ssoevents

## EXAMPLES

### EXAMPLE 1
```
Get-DuoAuthProxyLogs -LogName ssoevents -Search test
```

## PARAMETERS

### -ListLogs
List available log files

```yaml
Type: SwitchParameter
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogName
Name of log to get

```yaml
Type: String
Parameter Sets: Logs
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Search
Search object for string

```yaml
Type: String
Parameter Sets: Logs
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
