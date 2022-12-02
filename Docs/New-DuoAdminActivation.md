---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#create-administrator-activation-link
schema: 2.0.0
---

# New-DuoAdminActivation

## SYNOPSIS
Create Administrator Activation Link

## SYNTAX

```
New-DuoAdminActivation [-Email] <String> [[-AdminName] <String>] [[-AdminRole] <String>] [[-SendEmail] <Int32>]
 [[-ValidDays] <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Create a link to the activation form for a new administrator with email address email.
The administrator will not actually be created until the activation form is completed with further information (like the administrator's name and phone number).
Requires "Grant administrators" API permission.

## EXAMPLES

### EXAMPLE 1
```
New-DuoAdminActivation -Email peter.gibbons@initech.com
```

## PARAMETERS

### -Email
Email address for the new administrator.
Must not already be in use by any other administrator or pending administrator activation.

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

### -AdminName
The full name of the administrator.
The administrator's email will be used as the name if not specified.

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

### -AdminRole
The administrator's role.
One of: "Owner", "Administrator", "Application Manager", "User Manager", "Help Desk", "Billing", "Phishing Manager", or "Read-only".
The role names are case-sensitive.
Defaults to "Owner" if not specified.
Roles other than "Owner" are effective only if the customer edition includes the Administrative Roles feature.

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

### -SendEmail
If set to 1, the activation link and an introductory message will be emailed to the new administrator.
If set to 0, no email is sent, and the link is returned to the API method's caller only.
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

### -ValidDays
Number of days before the link expires.
Default: 7 Maximum: 31

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 0
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

## RELATED LINKS

[https://duo.com/docs/adminapi#create-administrator-activation-link](https://duo.com/docs/adminapi#create-administrator-activation-link)

