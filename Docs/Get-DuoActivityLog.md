---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#activity-logs
schema: 2.0.0
---

# Get-DuoActivityLog

## SYNOPSIS
Activity Logs

## SYNTAX

### Days
```
Get-DuoActivityLog -Days <Int32> [<CommonParameters>]
```

### Hours
```
Get-DuoActivityLog -Hours <Int32> [<CommonParameters>]
```

### MinMaxTime
```
Get-DuoActivityLog -MinTime <String> -MaxTime <String> [<CommonParameters>]
```

### DateTime
```
Get-DuoActivityLog -StartDate <DateTime> [-EndDate <DateTime>] [<CommonParameters>]
```

## DESCRIPTION
eturns a paged list of activity log events ranging from the last 180 days up to as recently as two minutes before the API request.
The events returned are subject to log retention, if set up in the account, as described her

## EXAMPLES

### EXAMPLE 1
```
Get-DuoActivityLog -Days 30
```

## PARAMETERS

### -Days
Number of days to retrieve with max time of now

```yaml
Type: Int32
Parameter Sets: Days
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Hours
Number of hours to retrieve with max time of now

```yaml
Type: Int32
Parameter Sets: Hours
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinTime
Return records that have a 13 character Unix timestamp in milliseconds of mintime or later.
This value must be strictly less then maxtime.

```yaml
Type: String
Parameter Sets: MinMaxTime
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxTime
Return records that have a 13 character Unix timestamp in milliseconds of maxtime or earlier.
This value must be strictly greater then mintime.

```yaml
Type: String
Parameter Sets: MinMaxTime
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartDate
The start date for log entries

```yaml
Type: DateTime
Parameter Sets: DateTime
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EndDate
The end date for log enties

```yaml
Type: DateTime
Parameter Sets: DateTime
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
This API endpoint is currently in Public Preview for Duo Access and Beyond.
Interested MFA plan customers can contact us to join the preview.

There is an intentional two-minute delay in the availability of new activity events in the API response.
Duo operates a large-scale distributed system, and this two-minute buffer period ensures that calls will return consistent results.
Querying for results more recent than two minutes will return as empty.

We recommend requesting logs no more than once per minute.

## RELATED LINKS

[https://duo.com/docs/adminapi#activity-logs](https://duo.com/docs/adminapi#activity-logs)

