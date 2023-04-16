---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#synchronize-user-from-directory
schema: 2.0.0
---

# Sync-DuoUserFromDirectory

## SYNOPSIS
Synchronize User from Directory

## SYNTAX

```
Sync-DuoUserFromDirectory [-DirectoryKey] <String> [-Username] <String> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Initiate a sync to create, update, or mark for deletion the user specified by username against the directory specified by the directory_key.
The directory_key for a directory can be found by navigating to Users -\> Directory Sync in the Duo Admin Panel, and then clicking on the configured directory.
Learn more about syncing individual users from Active Directory, OpenLDAP, or Azure Active Directory.
Requires "Grant write resource" API permission.

## EXAMPLES

### EXAMPLE 1
```
Sync-DuoUserFromDirectory -DirectoryKey 123456 -Username mbolton
```

## PARAMETERS

### -DirectoryKey
The directory key to sync from

```yaml
Type: String
Parameter Sets: (All)
Aliases: directory_key

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Username
The user to update or create via directory sync.
This should be the same as the value for the user's username attribute in the source directory as configured in the sync.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

[https://duo.com/docs/adminapi#synchronize-user-from-directory](https://duo.com/docs/adminapi#synchronize-user-from-directory)

