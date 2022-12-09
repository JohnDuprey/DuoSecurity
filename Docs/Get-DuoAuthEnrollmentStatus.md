---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/authapi#/enroll_status
schema: 2.0.0
---

# Get-DuoAuthEnrollmentStatus

## SYNOPSIS
Duo Auth Enrollment Status

## SYNTAX

```
Get-DuoAuthEnrollmentStatus [-UserId] <String> [-ActivationCode] <String> [<CommonParameters>]
```

## DESCRIPTION
Check whether a user has completed enrollment.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoAuthEnrollmentStatus -UserId SOMEUSERID -ActivationCode SOMEACTIVATIONCODE
```

## PARAMETERS

### -UserId
ID of the user.

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

### -ActivationCode
Activation code, as returned from /enroll.

```yaml
Type: String
Parameter Sets: (All)
Aliases: activation_code

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

[https://duo.com/docs/authapi#/enroll_status](https://duo.com/docs/authapi#/enroll_status)

