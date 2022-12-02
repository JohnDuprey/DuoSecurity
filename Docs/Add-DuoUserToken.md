---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version:
schema: 2.0.0
---

# Add-DuoUserToken

## SYNOPSIS
Associate Hardware Token with User

## SYNTAX

```
Add-DuoUserToken [-UserId] <String> [-TokenId] <String> [<CommonParameters>]
```

## DESCRIPTION
Associate a hardware token with the user with ID user_id.
Requires "Grant write resource" API permission.

Object limits: 100 tokens per user.

## EXAMPLES

### EXAMPLE 1
```
Add-DuoUserToken -UserId SOMEUSERID -TokenId SOMETOKENID
```

## PARAMETERS

### -UserId
The ID of the user

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

### -TokenId
The ID of the hardware token to associate with the user.

```yaml
Type: String
Parameter Sets: (All)
Aliases: token_id

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
General notes

## RELATED LINKS
