---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-users
schema: 2.0.0
---

# New-DuoPhone

## SYNOPSIS
Create Phone

## SYNTAX

```
New-DuoPhone [[-Number] <String>] [[-Name] <String>] [[-Extension] <String>] [[-Type] <String>]
 [[-Platform] <String>] [[-PostDelay] <Int32>] [[-PreDelay] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Create a new phone with a specified phone number or other parameters.
Requires "Grant write resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
New-DuoPhone -Name 'TestPhone -Number '+15558675309' -Type Mobile -Platform 'Apple iOS'
```

## PARAMETERS

### -Number
The phone number; E.164 format recommended (i.e.
"+17345551212").
If no leading plus sign is provided then it is assumed to be a United States number and an implicit "+1" country code is prepended.
Dashes and spaces are ignored.

A phone with a smartphone platform but no number is a tablet.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Free-form label for the phone.

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
The extension.

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

### -Type
The phone type.
See Retrieve Phones for a list of possible values.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: Mobile
Accept pipeline input: False
Accept wildcard characters: False
```

### -Platform
The phone platform.
See Retrieve Phones for a list of possible values.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: Generic Smartphone
Accept pipeline input: False
Accept wildcard characters: False
```

### -PostDelay
The time (in seconds) to wait after the extension is dialed and before the speaking the prompt.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PreDelay
The time (in seconds) to wait after the number picks up and before dialing the extension.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
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
