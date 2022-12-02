---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#send-activation-code-via-sms
schema: 2.0.0
---

# Send-DuoPhoneActivationSms

## SYNOPSIS
Send Activation Code via SMS

## SYNTAX

```
Send-DuoPhoneActivationSms [-PhoneId] <String> [[-ValidSecs] <Int32>] [[-Install] <Int32>]
 [[-InstallationMsg] <String>] [[-ActivationMsg] <String>] [<CommonParameters>]
```

## DESCRIPTION
Generate a Duo Mobile activation code and send it to the phone via SMS, optionally sending an additional message with a URL to install Duo Mobile.
This method will fail if the phone's type or platform are Unknown.
Requires "Grant write resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
Send-DuoPhoneActivationSms -PhoneId SOMEDUOID -ValidSecs 3600 -Install 1
```

## PARAMETERS

### -PhoneId
Parameter description

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
Specify 1 to cause an installation SMS message to be sent before the activation message, or 0 to not send an installation SMS message.
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

### -InstallationMsg
A custom installation message to send to the user.
Only valid if installation was requested.
Must contain the phrase "\<insturl\>", which is replaced with the installation URL.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ActivationMsg
A custom activation message to send to the user.
Must contain "\<acturl\>", which is replaced with the activation URL.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
SMS Size Limits
The recommended maximum length for activation_msg and installation_msg is 80 characters.

Activation and installation SMS messages are limited to 160 characters or less.
If providing custom text, please make sure to leave enough room for a URL to be sent in the same message.
The exact length available for custom text varies depending on the device's platform and whether international characters were used.
Activation URLs are typically about 60 characters long.
Installation URLs are between 50 and 75 characters long.

## RELATED LINKS

[https://duo.com/docs/adminapi#send-activation-code-via-sms](https://duo.com/docs/adminapi#send-activation-code-via-sms)

