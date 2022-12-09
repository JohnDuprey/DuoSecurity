---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/authapi#/auth_status
schema: 2.0.0
---

# Get-DuoAuthStatus

## SYNOPSIS
Duo API Auth Status

## SYNTAX

```
Get-DuoAuthStatus [-TxId] <String> [<CommonParameters>]
```

## DESCRIPTION
The /auth_status endpoint "long-polls" for the next status update from the authentication process for a given transaction.
That is to say, if no status update is available at the time the request is sent, it will wait until there is an update before returning a response.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoAuthStatus -TxId 66cc8d20-fdfa-41bc-8b74-1a3b095d55f7
```

## PARAMETERS

### -TxId
The transaction ID of the authentication attempt, as returned by the /auth endpoint.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

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

[https://duo.com/docs/authapi#/auth_status](https://duo.com/docs/authapi#/auth_status)

