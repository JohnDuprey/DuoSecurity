---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/accountsapi#delete-account
schema: 2.0.0
---

# Remove-DuoAccount

## SYNOPSIS
Delete Account

## SYNTAX

```
Remove-DuoAccount [-AccountId] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Delete the account with ID account_id from the system.

## EXAMPLES

### EXAMPLE 1
```
Remove-DuoAccount -AccountId SOMEACCOUNTID
```

## PARAMETERS

### -AccountId
ID of the customer account to delete as returned by Retrieve Accounts.
This is a 20 character string, for example DA9VZOC5X63I2W72NRP9.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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

## OUTPUTS

## NOTES

## RELATED LINKS

[https://duo.com/docs/accountsapi#delete-account](https://duo.com/docs/accountsapi#delete-account)

