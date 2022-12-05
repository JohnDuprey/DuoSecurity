---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-endpoints
schema: 2.0.0
---

# Get-DuoEndpoints

## SYNOPSIS
Retrieve Endpoints

## SYNTAX

```
Get-DuoEndpoints [[-EndpointKey] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a single endpoint or a paged list of endpoints.
Requires "Grant read resource" API permission.

Information for a given endpoint is purged after 30 days of inactivity.

Endpoint information retrievable by Duo Beyond and Duo Access customers.
In addition, some response information is available only with Duo Beyond.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoEndpoints
```

## PARAMETERS

### -EndpointKey
The key for the endpoint

```yaml
Type: String
Parameter Sets: (All)
Aliases: epkey

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

[https://duo.com/docs/adminapi#retrieve-endpoints](https://duo.com/docs/adminapi#retrieve-endpoints)

[https://duo.com/docs/adminapi#retrieve-endpoint-by-id](https://duo.com/docs/adminapi#retrieve-endpoint-by-id)

