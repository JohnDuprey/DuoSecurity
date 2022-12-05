---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#add-draft-custom-branding-user-by-id
schema: 2.0.0
---

# Add-DuoCustomBrandingDraftUser

## SYNOPSIS
Add Draft Custom Branding User by ID

## SYNTAX

```
Add-DuoCustomBrandingDraftUser [-UserId] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Add a single user with ID user_id to the list of draft branding test users.
Requires "Grant settings" API permission.

## EXAMPLES

### EXAMPLE 1
```
Add-DuoCustomBrandingDraftUser -UserId SOMEUSERID
```

## PARAMETERS

### -UserId
{{ Fill UserId Description }}

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

### None
## OUTPUTS

### PSCustomObject. Returns a Duo Response object.
## NOTES

## RELATED LINKS

[https://duo.com/docs/adminapi#add-draft-custom-branding-user-by-id](https://duo.com/docs/adminapi#add-draft-custom-branding-user-by-id)

