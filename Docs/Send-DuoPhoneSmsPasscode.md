---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#send-passcodes-via-sms
schema: 2.0.0
---

# Send-DuoPhoneSmsPasscode

## SYNOPSIS
Send Passcodes via SMS

## SYNTAX

```
Send-DuoPhoneSmsPasscode [-PhoneId] <String> [<CommonParameters>]
```

## DESCRIPTION
Generate a new batch of SMS passcodes send them to the phone in a single SMS message.
Requires "Grant write resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
Send-DuoPhoneSmsPasscode -PhoneId SOMEDUOID
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://duo.com/docs/adminapi#send-passcodes-via-sms](https://duo.com/docs/adminapi#send-passcodes-via-sms)

