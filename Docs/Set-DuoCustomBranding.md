---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#modify-custom-messaging
schema: 2.0.0
---

# Set-DuoCustomBranding

## SYNOPSIS
Modify Custom Messaging

## SYNTAX

### NoHelpText (Default)
```
Set-DuoCustomBranding [-HelpLinks <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### HelpText
```
Set-DuoCustomBranding [-HelpLinks <String[]>] -HelpText <String> [-Locale <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Updates current custom messaging settings, shown to users in the Universal Prompt.
These settings can also be viewed and set in the Duo Admin Panel.
Supersedes the helpdesk_message Settings parameter.
Requires "Grant settings" API permission.

## EXAMPLES

### EXAMPLE 1
```
Set-DuoCustomMessaging -HelpLinks 'https://duo.com/docs/adminapi#modify-custom-messaging'
```

## PARAMETERS

### -HelpLinks
A comma-separated list of up to two custom external links shown to users in the Universal Prompt.
Each URL must begin with http:// or https://.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HelpText
Customized text string associated with the specified locale.
The user's browser's preferred language settings determine which language to show in the Universal Prompt.
The first locale and message text in the list matches the default language specified in global Settings and is also shown in the traditional web prompt and in the Duo Device Health app.
Up to 200 characters.
No support for hyperlinks.

```yaml
Type: String
Parameter Sets: HelpText
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Locale
The language of the help text.
One of: en_US (English), cs_CZ (Czech), de_DE (German), es_ES (Spanish - Spain), es_419 (Spanish - Latin America), fi_FI (Finnish), fr_FR (French), hi_IN (Hindi), id_ID (Indonesian), it_IT (Italian), ja_JP (Japanese), ko_KR (Korean), nb_NO (Norwegian - Bokmål), pl_PL (Polish), pt_BR (Portuguese - Brazil), sv_SE (Swedish), th_TH (Thai), tr_TR (Turkish), vi_VN (Vietnamese), or zh_hans_CN (Chinese - Simplified).

```yaml
Type: String
Parameter Sets: HelpText
Aliases:

Required: False
Position: Named
Default value: En_US
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

### PSCustomObject. Returns a Duo Custom Messaing object.
## NOTES

## RELATED LINKS

[https://duo.com/docs/adminapi#modify-custom-messaging](https://duo.com/docs/adminapi#modify-custom-messaging)

