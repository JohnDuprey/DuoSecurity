---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#modify-administrator
schema: 2.0.0
---

# Update-DuoAdmin

## SYNOPSIS
Modify Administrator

## SYNTAX

```
Update-DuoAdmin [-AdminId] <String> [[-Name] <String>] [[-Phone] <String>] [-PasswordChangeRequested]
 [[-Role] <String>] [-RestrictedByAdminUnits] [[-Status] <String>] [[-TokenId] <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Change the name, phone number, or other properties of the administrator with the administrator ID admin_id.
Requires "Grant administrators" API permission.

## EXAMPLES

### EXAMPLE 1
```
Update-DuoAdmin -AdminId SOMEADMINID -Status Disabled
```

## PARAMETERS

### -AdminId
The ID of the administrator

```yaml
Type: String
Parameter Sets: (All)
Aliases: admin_id

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Name
New name for the administrator.
Read-only if the admin is managed by directory sync.

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

### -Phone
The phone number; E.164 format recommended (i.e.
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

### -PasswordChangeRequested
Specify true to require that the admin pick a new password at their next login, or false if no password change is required.
May not be changed to true if the admin has external password management enabled.

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

### -Role
New role for the administrator.
One of: "Owner", "Administrator", "Application Manager", "User Manager", "Help Desk", "Billing", "Phishing Manager", or "Read-only".
The role names are case-sensitive.
Roles other than "Owner" are effective only if the customer edition includes the Administrative Roles feature.
Read-only if the admin is managed by directory sync.

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

### -Status
The desired administrator account status.
Either "Active" or "Disabled" (case-sensitive).
Administrators with the "Owner" role may not be disabled via API.
To clear an inactive admin's "Expired" status, see Clear Administrator Expiration.
Read-only if the admin is managed by directory sync.

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

### -TokenId
The ID of the hardware token to associate with the administrator.
Specify with no value to remove any existing token assignment for that administrator.

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

[https://duo.com/docs/adminapi#modify-administrator](https://duo.com/docs/adminapi#modify-administrator)

