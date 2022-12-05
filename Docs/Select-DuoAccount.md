---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#reset-administrator-authentication-attempts
schema: 2.0.0
---

# Select-DuoAccount

## SYNOPSIS
Select Duo Account to use for Admin API

## SYNTAX

### AccountId
```
Select-DuoAccount -AccountId <String> [-Quiet] [<CommonParameters>]
```

### AccountName
```
Select-DuoAccount -Name <String> [-Quiet] [<CommonParameters>]
```

### Clear
```
Select-DuoAccount [-Clear] [-Quiet] [<CommonParameters>]
```

## DESCRIPTION
Takes values from the account list and creates API credentials for sub account

## EXAMPLES

### EXAMPLE 1
```
Select-DuoAccount -Name 'Some Company Name'
```

### EXAMPLE 2
```
Select-DuoAccount -AccountId SOMEACCOUNTID
```

## PARAMETERS

### -AccountId
Duo Account Id

```yaml
Type: String
Parameter Sets: AccountId
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Duo Account name

```yaml
Type: String
Parameter Sets: AccountName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Clear
Clear credentials

```yaml
Type: SwitchParameter
Parameter Sets: Clear
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Quiet
Suppress output

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
