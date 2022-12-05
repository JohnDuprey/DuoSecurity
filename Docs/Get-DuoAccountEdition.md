---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/accountsapi#set-telephony-credits
schema: 2.0.0
---

# Get-DuoAccountEdition

## SYNOPSIS
Set Telephony Credits

## SYNTAX

```
Get-DuoAccountEdition [-AccountId] <String> [-Credits] <Int32> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sets the telephony credits for a child account.

## EXAMPLES

### EXAMPLE 1
```
Set-DuoAccountTelephonyCredits -AccountId SOMEACCOUNTID -Credits
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

### -Credits
{{ Fill Credits Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: 0
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
Any additional credits added to the child account are transferred from the parent account.
For example, if the child account has 100 credits and it is then set to 300 credits, then 200 credits are deducted from the parent's balance and added to the child's balance.

## RELATED LINKS

[https://duo.com/docs/accountsapi#set-telephony-credits](https://duo.com/docs/accountsapi#set-telephony-credits)

