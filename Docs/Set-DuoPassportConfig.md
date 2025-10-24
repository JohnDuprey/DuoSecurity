---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#passport
schema: 2.0.0
---

# Set-DuoPassportConfig

## SYNOPSIS
Modify Passport Configuration

## SYNTAX

```
Set-DuoPassportConfig [-EnabledStatus <bool>] [-EnabledGroups <string[]>] [-CustomSupportedBrowsers <string[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Change Duo Passport configuration settings. Requires "Grant resource - Write" API permission.

## EXAMPLES

### EXAMPLE 1
```
Set-DuoPassportConfig -EnabledStatus $true
```

### EXAMPLE 2
```
Set-DuoPassportConfig -EnabledStatus $true -EnabledGroups @('group1', 'group2')
```

## PARAMETERS

### -CustomSupportedBrowsers
Array of custom browser configurations for Duo Passport.

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

### -EnabledGroups
Array of group IDs that should have access to Duo Passport.

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

### -EnabledStatus
Enable or disable Duo Passport for the account.

```yaml
Type: bool
Parameter Sets: (All)
Aliases:

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

### -WhatIf
Shows what would happen if the cmdlet runs. The cmdlet is not run.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### PSCustomObject. Duo Passport configuration response

## NOTES

## RELATED LINKS

[https://duo.com/docs/adminapi#passport](https://duo.com/docs/adminapi#passport)
