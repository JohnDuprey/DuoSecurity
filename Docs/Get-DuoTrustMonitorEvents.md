---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-events
schema: 2.0.0
---

# Get-DuoTrustMonitorEvents

## SYNOPSIS
Retrieve Trust Monitor Events

## SYNTAX

### Days
```
Get-DuoTrustMonitorEvents -Days <Int32> [-Type <String>] [<CommonParameters>]
```

### Hours
```
Get-DuoTrustMonitorEvents -Hours <Int32> [-Type <String>] [<CommonParameters>]
```

### MinMaxTime
```
Get-DuoTrustMonitorEvents -MinTime <String> -MaxTime <String> [-Type <String>] [<CommonParameters>]
```

### DateTime
```
Get-DuoTrustMonitorEvents -StartDate <DateTime> [-EndDate <DateTime>] [-Type <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a paged list of events surfaced by Trust Monitor from the last 180 days.
To fetch all results, call repeatedly with the next_offset paging parameter as long as the result metadata has next_offset values.
Requires "Grant read log" API permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoTrustMonitorEvents -Days 30
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

### -Type
{{ Fill Type Description }}

```yaml
Type: String
Parameter Sets: (All)
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
We recommend requesting Trust Monitor events no more than once per minute.

## RELATED LINKS

[https://duo.com/docs/adminapi#retrieve-events](https://duo.com/docs/adminapi#retrieve-events)

