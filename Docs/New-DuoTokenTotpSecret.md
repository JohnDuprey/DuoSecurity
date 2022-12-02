---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-users
schema: 2.0.0
---

# New-DuoTokenTotpSecret

## SYNOPSIS
Creates TOTP secret in Duo format

## SYNTAX

```
New-DuoTokenTotpSecret [[-SecretLength] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Creates both Base32 and Hex formatted secret keys for Duo token and TOTP app

## EXAMPLES

### EXAMPLE 1
```
New-DuoTokenTotpSecret
```

Base32                   Hex
------                   ---
EMFJSRYQRRWYXX6ME5T3DYZH 230a9947108c6d8bdfcc2767b1e327

## PARAMETERS

### -SecretLength
Length of secret

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 15
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
