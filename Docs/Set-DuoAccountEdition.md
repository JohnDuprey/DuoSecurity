---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/accountsapi#set-edition
schema: 2.0.0
---

# Set-DuoAccountEdition

## SYNOPSIS
Set Edition

## SYNTAX

```
Set-DuoAccountEdition [-AccountId] <String> [-Edition] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sets the edition for a child account.

## EXAMPLES

### EXAMPLE 1
```
Set-DuoAccountEdition -AccountId SOMEACCOUNTID -Edition 'BEYOND'
```

## PARAMETERS

### -AccountId
The child customer account ID as returned by Retrieve Accounts.
This is a 20 character string, for example DA9VZOC5X63I2W72NRP9.

```yaml
Type: String
Parameter Sets: (All)
Aliases: account_id

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Edition
The edition to set.
This should be one of:
ENTERPRISE
PLATFORM
BEYOND

```yaml
Type: String
Parameter Sets: (All)
Aliases:

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

[https://duo.com/docs/accountsapi#set-edition](https://duo.com/docs/accountsapi#set-edition)

