---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-users
schema: 2.0.0
---

# Remove-DuoUserPhone

## SYNOPSIS
Disassociate Phone from User

## SYNTAX

```
Remove-DuoUserPhone [-UserId] <String> [-PhoneId] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Disassociate a phone from the user with ID user_id.
The API will not automatically delete the phone after removing the last user association; remove it permanently with Delete Phone.
This method returns 200 if the phone was found or if no such phone exists.
Requires "Grant write resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
Remove-DuoUserPhone -UserId SOMEUSERID -PhoneId SOMEPHONEID
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

### -PhoneId
The ID of the Phone

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
