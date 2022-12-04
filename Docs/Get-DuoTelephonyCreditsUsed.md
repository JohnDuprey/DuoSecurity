---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#telephony-credits-used-report
schema: 2.0.0
---

# Get-DuoTelephonyCreditsUsed

## SYNOPSIS
Authentication Attempts Report

## SYNTAX

```
Get-DuoTelephonyCreditsUsed [[-MaxTime] <String>] [[-MinTime] <String>] [<CommonParameters>]
```

## DESCRIPTION
Retrieve counts of authentication attempts for a given time period (not to exceed 180 days), broken down by result.
Requires "Grant read information" API permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoTelephonyCreditsUsed
```

## PARAMETERS

### -MaxTime
Limit report to events before this Unix timestamp.
Defaults to the current time.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinTime
Limit report to events after this Unix timestamp.
Defaults to thirty days before maxtime.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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

[https://duo.com/docs/adminapi#telephony-credits-used-report](https://duo.com/docs/adminapi#telephony-credits-used-report)

