---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#modify-settings
schema: 2.0.0
---

# Update-DuoSetting

## SYNOPSIS
Modify Settings

## SYNTAX

```
Update-DuoSetting [[-CallerId] <String>] [[-FraudEmail] <String>] [-FraudEmailEnabled]
 [[-HelpdeskBypass] <String>] [[-HelpdeskBypassExpiration] <Int32>] [-HelpdeskCanSendEnrollEmail]
 [[-InactiveUserExpiration] <Int32>] [[-KeypressConfirm] <String>] [[-KeypressFraud] <String>]
 [[-Language] <String>] [[-LockoutExpireDuration] <Int32>] [[-LockoutThreshold] <Int32>]
 [[-MinimumPasswordLength] <Int32>] [-PasswordRequiresLowerAlpha] [-PasswordRequiresNumeric]
 [-PasswordRequiresSpecial] [-PasswordRequiresUpperAlpha] [[-SmsBatch] <Int32>] [[-SmsExpiration] <Int32>]
 [[-SmsMessage] <String>] [[-SmsRefresh] <Int32>] [[-TelephonyWarningMin] <Int32>] [[-Timezone] <String>]
 [-UserManagersCanPutUsersInBypass] [[-UserTelephonyCostMax] <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Change global Duo settings.
Requires "Grant settings" API permission.

## EXAMPLES

### EXAMPLE 1
```
Update-DuoSetting -FraudEmail helpdesk@domain.com
```

## PARAMETERS

### -CallerId
Automated calls will appear to come from this number.
This does not apply to text messages.
Customizing this number may cause telephony providers to flag your number as fraudulent and result in failed user authentications.

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

### -FraudEmail
The email address to be notified when a user reports a fraudulent authentication attempt or is locked out due to failed authentication attempts, or empty for all administrators will be notified.
If fraud_email is set to a specific email address and fraud_email_enabled is set to false, the specific email address value is cleared.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FraudEmailEnabled
Set to true to enable fraudulent authentication notification emails.
False disables the fraud email functionality.
If fraud_email is set to a specific email address and fraud_email_enabled is set to false, the specific email address value is cleared.

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

### -HelpdeskBypass
Grants permission for administrators with the Help Desk role to generate bypass codes for users.
The default value allow permits unrestricted generation of bypass codes, limit plus a value for helpdesk_bypass_expiration allows Help Desk admins to generate bypass codes with a preset expirtation, and deny prevents Help Desk admins from generating any bypass codes.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HelpdeskBypassExpiration
Integer specifying a default expiration for bypass codes generated by Help Desk admins, in minutes.
If not set, Help Desk admins may change bypass code expiration from the default 60 minutes after creation if helpdesk_bypass is set to allow.
If specifying a value, also set helpdesk_bypass to limit.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -HelpdeskCanSendEnrollEmail
Permits Help Desk administrators to send or resend enrollment emails to users.
Set to true to allow sending of enrollment emails.
Default value is false.

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

### -InactiveUserExpiration
Users will be automatically deleted if they are inactive (no successful logins) for this number of days.
Minimum: 30 Maximum: 365

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -KeypressConfirm
The key for users to press to authenticate, or empty if any key should be pressed to authenticate.
If this is empty, keypress_fraud must be as well.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -KeypressFraud
The key for users to report fraud, or empty if any key should be pressed to authenticate.
If this is empty, keypress_confirm must be as well.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Language
ets the language used in the browser-based user authentication prompt.
One of: "EN", "DE", "FR".
Default: "EN"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LockoutExpireDuration
If non-zero, the time in minutes until a locked-out user's status reverts to "Active".
If 0, a user remains locked out until their status is manually changed (By an admin or API call).
Minimum: 5 Maximum: 30000

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -LockoutThreshold
The number of consecutive failed authentication attempts before the user's status is set to "Locked Out" and the user is denied access.
Default is 10 attempts.
Minimum: 1 Maximum: 9999

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinimumPasswordLength
The minimum number of characters that an administrator's Duo Admin Panel password must contain.
This is only enforced on password creation and reset; existing passwords will not be invalidated.
Default: 12.
Minimum: 12 Maximum: 100

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PasswordRequiresLowerAlpha
If true, administrator passwords will be required to contain a lower case alphabetic character.
If false, administrator passwords will not be required to contain a lower case alphabetic character.
This is only enforced on password creation and reset; existing passwords will not be invalidated.
Default: false.

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

### -PasswordRequiresNumeric
If true, administrator passwords will be required to contain a numeric character.
If false, administrator passwords will not be required to contain a numeric character.
This is only enforced on password creation and reset; existing passwords will not be invalidated.
Default: false.

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

### -PasswordRequiresSpecial
If true, administrator passwords will be required to contain a special (non-alphanumeric) character.
If false, administrator passwords will not be required to contain a special (non-alphanumeric) character.
This is only enforced on password creation and reset; existing passwords will not be invalidated.
Default: false.

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

### -PasswordRequiresUpperAlpha
If true, administrator passwords will be required to contain an upper case alphabetic character.
If false, administrator passwords will not be required to contain an upper case alphabetic character.
This is only enforced on password creation and reset; existing passwords will not be invalidated.
Default: false.

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

### -SmsBatch
The number of passcodes to send at one time, up to 10.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SmsExpiration
The time in minutes to expire and invalidate SMS passcodes, or empty if they should not expire.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SmsMessage
Description sent with every batch of SMS passcodes.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SmsRefresh
If 1, a new set of SMS passcodes will automatically be sent after the last one is used.
If 0, a new set will not be sent.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -TelephonyWarningMin
Configure a alert to be sent when the account has fewer than this many telephony credits remaining.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Timezone
This is the timezone used when displaying timestamps in the Duo Admin Panel.
Timezones must be entries in the IANA Time Zone Database, for example, "US/Eastern", "Australia/Darwin", "GMT".

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserManagersCanPutUsersInBypass
Permits User Manager administrators to apply "Bypass" status to users.
Set to false to prevent User Managers from applying "Bypass" status.
Default value is true.

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

### -UserTelephonyCostMax
The maximum number of telephony credits a user may consume in a single authentication event.
This excludes Duo administrators authenticating to the Duo administration panel.
If you know the countries from which your users expect to authenticate with phone callback we recommend adjusting this down from the default to match the most expensive expected country to help avoid misuse, using the values from the Telephony Credits documentation.
Default: 20.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 18
Default value: 0
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

### None
## OUTPUTS

### PSCustomObject. Duo Settings object
## NOTES

## RELATED LINKS

[https://duo.com/docs/adminapi#modify-settings](https://duo.com/docs/adminapi#modify-settings)

