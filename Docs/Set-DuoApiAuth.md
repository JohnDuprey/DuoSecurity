---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#restrict-administrator-authentication-factors
schema: 2.0.0
---

# Set-DuoApiAuth

## SYNOPSIS
Sets credentials for Duo

## SYNTAX

```
Set-DuoApiAuth [-ApiHost] <String> [-IntegrationKey] <String> [-SecretKey] <String> [[-Type] <String>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Saves credentials as script scoped variables for use in the module

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -ApiHost
Hostname (excluding https://)

```yaml
Type: String
Parameter Sets: (All)
Aliases: api_hostname

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -IntegrationKey
Integration key

```yaml
Type: String
Parameter Sets: (All)
Aliases: integration_key

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SecretKey
Secret key

```yaml
Type: String
Parameter Sets: (All)
Aliases: secret_key

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Type
Type of credential

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: Admin
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
