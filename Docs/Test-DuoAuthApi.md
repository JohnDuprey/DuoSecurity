---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/authapi#/check
schema: 2.0.0
---

# Test-DuoAuthApi

## SYNOPSIS
Check Duo API

## SYNTAX

```
Test-DuoAuthApi [<CommonParameters>]
```

## DESCRIPTION
The /check endpoint can be called to verify that the Auth API integration and secret keys are valid, and that the signature is being generated properly.

## EXAMPLES

### EXAMPLE 1
```
Test-DuoAuthApi
```

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
This endpoint is also suitable for use with Duo's v2 Web SDK to verify integration information before initializing frame authentication.

## RELATED LINKS

[https://duo.com/docs/authapi#/check](https://duo.com/docs/authapi#/check)

