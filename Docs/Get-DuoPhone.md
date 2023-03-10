---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-phones
schema: 2.0.0
---

# Get-DuoPhone

## SYNOPSIS
Retrieve Phones

## SYNTAX

```
Get-DuoPhone [[-PhoneId] <String>] [[-Number] <String>] [[-Extension] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Returns a single phone or a paged list of phones.
If no number or extension parameters are provided, the list will contain all phones.
Otherwise, the list will contain either single phone (if a match was found), or no phones.
Requires "Grant read resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoPhones
```

## PARAMETERS

### -PhoneId
Id of phone

```yaml
Type: String
Parameter Sets: (All)
Aliases: phone_id

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Number
Specify a phone number in E.164 format to look up a single phone.

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

### -Extension
The extension, if necessary.

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

[https://duo.com/docs/adminapi#retrieve-phones](https://duo.com/docs/adminapi#retrieve-phones)

[https://duo.com/docs/adminapi#retrieve-phone-by-id](https://duo.com/docs/adminapi#retrieve-phone-by-id)

