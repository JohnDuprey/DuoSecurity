---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#publish-draft-custom-branding-as-live-custom-branding
schema: 2.0.0
---

# Publish-DuoCustomBranding

## SYNOPSIS
Publish Draft Custom Branding as Live Custom Branding

## SYNTAX

```
Publish-DuoCustomBranding [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Replaces the current live custom branding with the draft custom branding for all users and then removes the draft branding.
Requires "Grant settings" API permission.

## EXAMPLES

### EXAMPLE 1
```
Publish-DuoCustomBranding
```

## PARAMETERS

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

[https://duo.com/docs/adminapi#publish-draft-custom-branding-as-live-custom-branding](https://duo.com/docs/adminapi#publish-draft-custom-branding-as-live-custom-branding)

