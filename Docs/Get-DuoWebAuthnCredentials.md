---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-users
schema: 2.0.0
---

# Get-DuoWebAuthnCredentials

## SYNOPSIS
Retrieve WebAuthn Credentials by Key

## SYNTAX

### List (Default)
```
Get-DuoWebAuthnCredentials [<CommonParameters>]
```

### Single
```
Get-DuoWebAuthnCredentials [-WebAuthnKey <String>] [<CommonParameters>]
```

## DESCRIPTION
Return the single WebAuthn credential with webauthnkey.
Requires "Grant read resource" API permission.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -WebAuthnKey
WebAuthn Key

```yaml
Type: String
Parameter Sets: Single
Aliases:

Required: False
Position: Named
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
