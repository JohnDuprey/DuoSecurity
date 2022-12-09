---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#add-administrative-unit
schema: 2.0.0
---

# New-DuoAuthEnrollment

## SYNOPSIS
Duo Auth Enrollment

## SYNTAX

```
New-DuoAuthEnrollment [[-Username] <String>] [[-ValidSecs] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
The /enroll endpoint provides a programmatic way to enroll new users with Duo two-factor authentication.
It creates the user in Duo and returns a code (as a QR code) that Duo Mobile can scan with its built-in camera.
Scanning the QR code adds the user's account to the app so that they receive and respond to Duo Push login requests.

## EXAMPLES

### EXAMPLE 1
```
New-DuoAuthEnrollment
```

## PARAMETERS

### -Username
Username for the created user.
If not given, a random username will be assigned and returned.

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

### -ValidSecs
Seconds for which the activation code will remain valid.
Default: 86400 (one day).

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
General notes

## RELATED LINKS
