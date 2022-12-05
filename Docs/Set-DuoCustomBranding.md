---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#modify-live-custom-branding
schema: 2.0.0
---

# Set-DuoCustomBranding

## SYNOPSIS
Modify Custom Branding

## SYNTAX

```
Set-DuoCustomBranding [-Draft] [[-BackgroundImg] <String>] [[-CardAccentColor] <String>] [[-Logo] <String>]
 [[-PageBackgroundColor] <String>] [-PoweredByDuo] [[-UserIds] <String[]>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Change effective or draft custom branding settings.
These settings can also be viewed and set in the Duo Admin Panel.
Requires "Grant settings" API permission.

## EXAMPLES

### EXAMPLE 1
```
Set-DuoCustomBranding -Draft -Logo c:\path\to\logo.png
```

## PARAMETERS

### -Draft
Use this switch to modify the draft branding instead of live.

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

### -BackgroundImg
A PNG file path or base64 encoded background image in PNG format, with maximum size less than 3MB and dimensions between 12 by 12 pixels and 3840 by 2160 pixels.
Shown in Duo SSO and Duo Universal Prompt.

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

### -CardAccentColor
A CSS hex color shown as the hash symbol (#) followed by three or six hexadecimal digits, which represents the colored line appearing at the top of the interactive user interface.
Shown in Duo SSO and Universal Prompt.

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

### -Logo
A PNG file path or base64 encoded logo image in PNG format, with maximum size less than 200KB and dimensions between 12 by 12 pixels and 500 by 500 pixels.
Shown in Duo SSO, Duo Universal Prompt, and traditional prompt.

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

### -PageBackgroundColor
A CSS hex color shown as the hash symbol (#) followed by three or six hexadecimal digits, which represents the color appearing behind the user interface and any transparent background image.
Shown in Duo SSO and Universal Prompt.

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

### -PoweredByDuo
If true, Duo SSO, Duo Universal Prompt, and traditional prompt show the "Secured by Duo" branding.
Otherwise, false.

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

### -UserIds
A comma separated list of user IDs that will see saved draft branding in Duo SSO and Duo Universal Prompt.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
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

### None
## OUTPUTS

### PSCustomObject. Returns a Duo Response object.
## NOTES
This commandlet supports both Draft and Live branding options.

## RELATED LINKS

[https://duo.com/docs/adminapi#modify-live-custom-branding](https://duo.com/docs/adminapi#modify-live-custom-branding)

[https://duo.com/docs/adminapi#modify-draft-custom-branding](https://duo.com/docs/adminapi#modify-draft-custom-branding)

