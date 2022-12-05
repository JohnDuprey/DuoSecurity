---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-custom-messaging
schema: 2.0.0
---

# Get-DuoCustomMessaging

## SYNOPSIS
Retrieve Custom Messaging

## SYNTAX

```
Get-DuoCustomMessaging [<CommonParameters>]
```

## DESCRIPTION
Returns effective custom messaging settings, shown to users in the Universal Prompt.
These settings can also be viewed and set in the Duo Admin Panel.
Supersedes the helpdesk_message Settings parameter.
Requires "Grant settings" API permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoCustomMessaging
```

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### PSCustomObject. Returns a Duo Custom Messaging object.
## NOTES

## RELATED LINKS

[https://duo.com/docs/adminapi#retrieve-custom-messaging](https://duo.com/docs/adminapi#retrieve-custom-messaging)

