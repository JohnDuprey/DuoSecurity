---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#offline-enrollment-logs
schema: 2.0.0
---

# Get-DuoOfflineEnrollmentLogs

## SYNOPSIS
Offline Enrollment Logs

## SYNTAX

### None (Default)
```
Get-DuoOfflineEnrollmentLogs [<CommonParameters>]
```

### UnixTime
```
Get-DuoOfflineEnrollmentLogs [-MinTime <String>] [<CommonParameters>]
```

### DateTime
```
Get-DuoOfflineEnrollmentLogs [-StartDate <String>] [<CommonParameters>]
```

### Days
```
Get-DuoOfflineEnrollmentLogs [-Days <Int32>] [<CommonParameters>]
```

### Hours
```
Get-DuoOfflineEnrollmentLogs [-Hours <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of Duo Authentication for Windows Logon offline enrollment events ranging from the last 180 days up to as recently as two minutes before the API request.
There is an intentional two minute delay in availability of new authentications in the API response.
Duo operates a large scale distributed system, and this two minute buffer period ensures that calls will return consistent results.
Querying for results more recent than two minutes will return as empty.
Requires "Grant read log" API permission.

The 1000 earliest events will be returned; you may need to call this multiple times with mintime to page through the entire log.
Note that more or fewer than 1000 events may be returned depending on how many actual events exist for the specified mintime.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoOfflineEnrollmentLogs
```

## PARAMETERS

### -MinTime
Only return records that have a Unix timestamp in seconds of mintime or later.
Use mintime+1 to avoid receiving duplicate data.

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

[https://duo.com/docs/adminapi#offline-enrollment-logs](https://duo.com/docs/adminapi#offline-enrollment-logs)

