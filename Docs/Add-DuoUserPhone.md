---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#associate-phone-with-user
schema: 2.0.0
---

# Add-DuoUserPhone

## SYNOPSIS
Associate Phone with User

## SYNTAX

```
Add-DuoUserPhone [-UserId] <String> [-PhoneId] <String> [<CommonParameters>]
```

## DESCRIPTION
Associate a phone with the user with ID user_id.
Requires "Grant write resource" API permission.

Object limits: 100 phones per user; 100 users per phone.

## EXAMPLES

### EXAMPLE 1
```
Add-DuoUserPhone -UserId SOMEUSERID -PhoneId SOMEPHONEID
```

## PARAMETERS

### -UserId
The ID of the user

```yaml
Type: String
Parameter Sets: (All)
Aliases: user_id

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PhoneId
The ID of the phone to associate with the user.

```yaml
Type: String
Parameter Sets: (All)
Aliases: phone_id

Required: True
Position: 2
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

[https://duo.com/docs/adminapi#associate-phone-with-user](https://duo.com/docs/adminapi#associate-phone-with-user)

