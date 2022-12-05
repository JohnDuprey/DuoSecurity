---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#create-administrator
schema: 2.0.0
---

# New-DuoAdmin

## SYNOPSIS
Create Administrator

## SYNTAX

```
New-DuoAdmin [-Email] <String> [-Name] <String> [[-Phone] <String>] [[-Role] <String>]
 [-RestrictedByAdminUnits] [[-SendEmail] <Int32>] [[-TokenId] <String>] [[-ValidDays] <Int32>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Create a new administrator.
Requires "Grant administrators" API permission.

## EXAMPLES

### EXAMPLE 1
```
New-DuoAdmin -Email peter.gibbons@initech.com -Name 'Peter Gibbons'
```

## PARAMETERS

### -Email
Valid email address for the new administrator.

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

### -Name
Name for the new administrator.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Phone
Phone number for the new administrator; E.164 format recommended (i.e.
"+17345551212").
If no leading plus sign is provided then it is assumed to be a United States number and an implicit "+1" country code is prepended.
Dashes and spaces are ignored.

If this parameter is specified it cannot be empty.

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

### -Role
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
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RestrictedByAdminUnits
Is this administrator restricted by an administrative unit assignment?
Either true or false.
Defaults to false if not specified.
Must be set to true in order to add the admin to an administrative unit using the API.
Note that attempting to set to true for admins with the "Owner" role results in a failure response.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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
Position: 5
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -TokenId
The token_id of the hardware token to associate with the administrator.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ValidDays
Number of days before the activation link expires.
Default: 7 Maximum:: 31

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

[https://duo.com/docs/adminapi#create-administrator](https://duo.com/docs/adminapi#create-administrator)

