---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/authapi#/ping
schema: 2.0.0
---

# Send-DuoAuthPing

## SYNOPSIS
Duo API Ping

## SYNTAX

```
Send-DuoAuthPing [<CommonParameters>]
```

## DESCRIPTION
The /ping endpoint acts as a "liveness check" that can be called to verify that Duo is up before trying to call other Auth API endpoints.
Unlike the other endpoints, this one does not have to be signed with the Authorization header.

## EXAMPLES

### EXAMPLE 1
```
Send-DuoAuthPing
```

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
This endpoint is also suitable for use with Duo's v2 Web SDK to verify that Duo's service is responding before initializing frame authentication.

## RELATED LINKS

[https://duo.com/docs/authapi#/ping](https://duo.com/docs/authapi#/ping)

