---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-users
schema: 2.0.0
---

# Remove-DuoUser

## SYNOPSIS
Delete User

## SYNTAX

```
Remove-DuoUser [-UserId] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Delete the user with ID user_id from the system.
The API will not automatically delete phones associated with the user; remove them permanently with Delete Phone.
This method returns 200 if the phone was found or if no such phone exists.
Requires "Grant write resource" API permission.

Users deleted by the API do not get moved into the Trash view as "Pending Deletion" as they would if removed by directory sync, inactive user expiration, or interactively from the Duo Admin Panel, and therefore are not available for restoration.
Users deleted via the API are immediately and permanently removed from Duo.

## EXAMPLES

### EXAMPLE 1
```
Remove-DuoUser -UserId SOMEUSERID
```

## PARAMETERS

### -UserId
The ID of the User

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
General notes

## RELATED LINKS
