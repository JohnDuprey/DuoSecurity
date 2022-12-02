---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-users
schema: 2.0.0
---

# Send-DuoPhoneInstallationSms

## SYNOPSIS
Send Installation URL via SMS

## SYNTAX

```
Send-DuoPhoneInstallationSms [-PhoneId] <String> [[-InstallationMsg] <String>] [<CommonParameters>]
```

## DESCRIPTION
Send a message via SMS describing how to install Duo Mobile.
This method will fail if the phone's type or platform are Unknown.
Requires "Grant write resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
- Your friendly IT department'
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

### -InstallationMsg
A custom installation message to send to the user.
Must contain the phrase "\<insturl\>", which is replaced with the installation URL.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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
The recommended maximum length for installation_msg is 80 characters.

Installation SMS messages are limited to 160 characters or less.
If providing custom text, please make sure to leave enough room for a URL to be sent in the same message.
The exact length available for custom text varies depending on the device's platform and whether international characters were used.
Installation URLs are between 50 and 75 characters long.

## RELATED LINKS
