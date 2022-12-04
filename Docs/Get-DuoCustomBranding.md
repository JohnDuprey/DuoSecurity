---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#retrieve-live-custom-branding
schema: 2.0.0
---

# Get-DuoCustomBranding

## SYNOPSIS
Retrieve Draft Custom Branding

## SYNTAX

```
Get-DuoCustomBranding [-Draft] [[-OutputDirectory] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns custom branding settings.
These settings can also be viewed and set in the Duo Admin Panel.
Requires "Grant settings" API permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoCustomBranding
```

## PARAMETERS

### -Draft
Use this switch to retreieve the draft branding

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

### -OutputDirectory
Path to save the branding images to

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://duo.com/docs/adminapi#retrieve-live-custom-branding](https://duo.com/docs/adminapi#retrieve-live-custom-branding)

