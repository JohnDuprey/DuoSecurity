---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/accountsapi#get-edition
schema: 2.0.0
---

# Get-DuoAccountEdition

## SYNOPSIS
Get Edition

## SYNTAX

```
Get-DuoAccountEdition [-AccountId] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Returns the edition for a child account.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoAccounts | Select-Object name,account_id, @{n='edition'; e={($_ | Get-DuoAccountEdition).edition}}
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

### PSCustomObject. Duo Accounts object
## OUTPUTS

### PSCustomObject. Returns a Duo Response object.
## NOTES

## RELATED LINKS

[https://duo.com/docs/accountsapi#get-edition](https://duo.com/docs/accountsapi#get-edition)

