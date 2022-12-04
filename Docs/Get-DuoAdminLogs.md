---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#administrator-logs
schema: 2.0.0
---

# Get-DuoAdminLogs

## SYNOPSIS
Administrator Logs

## SYNTAX

### None (Default)
```
Get-DuoAdminLogs [<CommonParameters>]
```

### UnixTime
```
Get-DuoAdminLogs [-MinTime <String>] [<CommonParameters>]
```

### DateTime
```
Get-DuoAdminLogs [-StartDate <String>] [<CommonParameters>]
```

### Days
```
Get-DuoAdminLogs [-Days <Int32>] [<CommonParameters>]
```

### Hours
```
Get-DuoAdminLogs [-Hours <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of administrator log events.
Only the 1000 earliest events will be returned; you may need to call this multiple times with mintime to page through the entire log.
Requires "Grant read log" API permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoUserAuthenticationAttempts
```

## PARAMETERS

### -MinTime
Limit report to events after this Unix timestamp.

```yaml
Type: String
Parameter Sets: UnixTime
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartDate
{{ Fill StartDate Description }}

```yaml
Type: String
Parameter Sets: DateTime
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Days
{{ Fill Days Description }}

```yaml
Type: Int32
Parameter Sets: Days
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Hours
{{ Fill Hours Description }}

```yaml
Type: Int32
Parameter Sets: Hours
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
We recommend requesting logs no more than once per minute.

## RELATED LINKS

[https://duo.com/docs/adminapi#administrator-logs](https://duo.com/docs/adminapi#administrator-logs)

