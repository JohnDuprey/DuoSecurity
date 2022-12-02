---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version:
schema: 2.0.0
---

# Get-DuoTokens

## SYNOPSIS
Retrieve Hardware Tokens

## SYNTAX

### List (Default)
```
Get-DuoTokens [-Type <String>] [-Serial <String>] [<CommonParameters>]
```

### Single
```
Get-DuoTokens [-TokenId <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a single hardware token or a paged list of OTP hardware tokens.
If no type and serial parameters are provided, the list will contain all hardware tokens.
Otherwise, the list will contain either a single hardware token (if a match was found) or no hardware tokens.
Requires "Grant read resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoTokens
```

## PARAMETERS

### -TokenId
Id of token

```yaml
Type: String
Parameter Sets: Single
Aliases: token_id

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Type
Specify a type and serial number to look up a single hardware token.
One of:

Type	Description
"t6"    TOTP-6 hardware token
"t8"    TOTP-8 hardware token
"h6"	HOTP-6 hardware token
"h8"	HOTP-8 hardware token
"yk"	YubiKey AES hardware token
"d1"	Duo-D100 hardware token
* This option is required if serial is present.

```yaml
Type: String
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Serial
The serial number of the hardware token.
* This option is required if type is present.

```yaml
Type: String
Parameter Sets: List
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

## RELATED LINKS
