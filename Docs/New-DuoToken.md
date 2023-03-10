---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#create-hardware-token
schema: 2.0.0
---

# New-DuoToken

## SYNOPSIS
Create Hardware Token

## SYNTAX

```
New-DuoToken [-Type] <String> [-Serial] <String> [[-Secret] <String>] [[-Counter] <Int32>]
 [[-PrivateId] <String>] [[-AesKey] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Create a new hardware token.
Requires "Grant write resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
$Secret = New-DuoTokenTotpSecret
New-DuoToken -Serial 001 -Type t6 -Secret $Secret.Hex
```

## PARAMETERS

### -Type
The type of hardware token to import.
One of:

Type	Description
----    -----------
"t6"	TOTP-6 hardware token
"t8"	TOTP-8 hardware token
"h6"	HOTP-6 hardware token
"h8"	HOTP-8 hardware token
"yk"	YubiKey AES hardware token
Duo-D100 tokens (type "d1") are imported when purchased from Duo and may not be created via the Admin API.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Serial
The serial number of the token (maximum length 128 characters).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Secret
The TOTP/HOTP secret.
This parameter is required for TOTP-6, TOTP-8, HOTP-6 and HOTP-8 hardware tokens.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Counter
Initial value for the HOTP counter.
This parameter is only valid for TOTP-6, TOTP-8, HOTP-6 and HOTP-8 hardware tokens.
Default: 0.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PrivateId
The 12-character YubiKey private ID.
This parameter is required for YubiKey hardware tokens.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AesKey
The 32-character YubiKey AES key.
This parameter is required for YubiKey hardware tokens.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

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
See New-DuoTokenTotpSecret for more info about generating TOTP secrets

## RELATED LINKS

[https://duo.com/docs/adminapi#create-hardware-token](https://duo.com/docs/adminapi#create-hardware-token)

