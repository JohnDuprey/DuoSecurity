---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-users
schema: 2.0.0
---

# New-DuoPhoneActivationCode

## SYNOPSIS
Create Activation Code

## SYNTAX

```
New-DuoPhoneActivationCode [-PhoneId] <String> [[-ValidSecs] <Int32>] [[-Install] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Generate a Duo Mobile activation code.
This method will fail if the phone's type or platform are Unknown.
Requires "Grant write resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
An example
```

## PARAMETERS

### -PhoneId
Id of phone

```yaml
Type: String
Parameter Sets: (All)
Aliases: phone_id

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ValidSecs
The number of seconds this activation code remains valid.
Default: 86400 (one day).
Expiration not supported for legacy phone platforms that support passcode generation only (not Duo Push).

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 86400
Accept pipeline input: False
Accept wildcard characters: False
```

### -Install
Specify 1 to also return an installation URL for Duo Mobile; 0 to not return a URL.
Default: 0.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
