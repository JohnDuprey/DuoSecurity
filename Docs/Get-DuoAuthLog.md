---
external help file: DuoSecurity-help.xml
Module Name: DuoSecurity
online version: https://duo.com/docs/adminapi#authentication-logs
schema: 2.0.0
---

# Get-DuoAuthLog

## SYNOPSIS
Authentication Logs

## SYNTAX

### Days
```
Get-DuoAuthLog -Days <Int32> [-Applications <String[]>] [-Users <String[]>] [-EventTypes <String[]>]
 [-Factors <String[]>] [-Groups <String[]>] [-PhoneNumbers <String[]>] [-Reasons <String[]>]
 [-Results <String[]>] [-Tokens <String[]>] [<CommonParameters>]
```

### Hours
```
Get-DuoAuthLog -Hours <Int32> [-Applications <String[]>] [-Users <String[]>] [-EventTypes <String[]>]
 [-Factors <String[]>] [-Groups <String[]>] [-PhoneNumbers <String[]>] [-Reasons <String[]>]
 [-Results <String[]>] [-Tokens <String[]>] [<CommonParameters>]
```

### MinMaxTime
```
Get-DuoAuthLog -MinTime <String> -MaxTime <String> [-Applications <String[]>] [-Users <String[]>]
 [-EventTypes <String[]>] [-Factors <String[]>] [-Groups <String[]>] [-PhoneNumbers <String[]>]
 [-Reasons <String[]>] [-Results <String[]>] [-Tokens <String[]>] [<CommonParameters>]
```

### DateTime
```
Get-DuoAuthLog -StartDate <DateTime> [-EndDate <DateTime>] [-Applications <String[]>] [-Users <String[]>]
 [-EventTypes <String[]>] [-Factors <String[]>] [-Groups <String[]>] [-PhoneNumbers <String[]>]
 [-Reasons <String[]>] [-Results <String[]>] [-Tokens <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Returns a paged list of authentication log events ranging from the last 180 days up to as recently as two minutes before the API request.
Requires "Grant read log" API permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DuoAuthLog -Days 30 -EventTypes authentication -Factors duo_push -Results denied
```

## PARAMETERS

### -Days
Number of days to retrieve with max time of now

```yaml
Type: Int32
Parameter Sets: Days
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Hours
Number of hours to retrieve with max time of now

```yaml
Type: Int32
Parameter Sets: Hours
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinTime
Return records that have a 13 character Unix timestamp in milliseconds of mintime or later.
This value must be strictly less then maxtime.

```yaml
Type: String
Parameter Sets: MinMaxTime
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxTime
Return records that have a 13 character Unix timestamp in milliseconds of maxtime or earlier.
This value must be strictly greater then mintime.

```yaml
Type: String
Parameter Sets: MinMaxTime
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartDate
The start date for log entries

```yaml
Type: DateTime
Parameter Sets: DateTime
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EndDate
The end date for log enties

```yaml
Type: DateTime
Parameter Sets: DateTime
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Applications
An integration's integration_key or the key value for an application returned in the authentication log output.

Default: Return logs for all applications.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Users
A user's user_id or the key value for a user returned in the authentication log output.

Default: Return logs for all users.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EventTypes
The type of authentication event.
One of:

| Value | Description |
|-------|-------------|
| authentication    | Return events for authentication attempts.
| enrollment        | Return events related to a user completing Duo's inline enrollment.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Factors
The factor or method used for an authentication attempt.
One of:

| Value	| Description |
|-------|-------------|
| duo_push                      | Return events where the authentication factor was "Duo Push".
| phone_call                    | Return events where the authentication factor was a phone call.
| u2f_token	                    | Return events where the authentication factor was a U2F token.
| hardware_token                | Return events where the authentication factor was a hardware token passcode.
| bypass_code                   | Return events where the authentication factor was a bypass code.
| sms_passcode                  | Return events where the authentication factor was an SMS passcode.
| duo_mobile_passcode           | Return events where the authentication factor was a passcode generated by "Duo Mobile".
| yubikey_code                  | Return events where the authentication factor was a Yubikey OTP token passcode.
| passcode                      | Return events where the authentication factor was a passcode not identified as another known type.
| digipass_go_7_token           | Return events where the authentication factor was a Digipass GO 7 token purchased from Duo.
| WebAuthn Security Key         | Return events where the authentication factor was a FIDO2 security key.
| WebAuthn Chrome Touch ID      | Return events where the authentication factor was Apple Touch ID with the Chrome browser.
| WebAuthn Credential           | Return events where the authentication factor was a WebAuthn authenticator other than a security key or Touch ID.
| not_available                 | Return events where the authentication factor is not available.
| sms_refresh                   | Return events where the user requested a refresh batch of SMS passcodes.
| remembered_device             | Return events where the authentication factor was the remembered device token from a previous authentication success.
| trusted_network               | Return events where the effective authentication factor was an authorized network.
| trusted_mobile_authenticator  | Return events where the effective authentication factor Duo Mobile Inline Auth on an Android or iOS device.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Groups
A group's group_id or the key value for a group returned in the authentication log output.

Default: Return logs for all groups.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PhoneNumbers
A phone's number as returned in the authentication log output.
If the phone has been given a text name then both are returned in the format name (number).

Default: Return logs for all phone numbers used.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Reasons
The reason associated with an authentication attempt.
One of:

| Value | Description |
|-------|-------------|
| user_marked_fraud                                 | Return events where authentication was denied because the end user explicitly marked "fraudulent".
| deny_unenrolled_user                              | Return events where authentication was denied because of the following policy: "deny not enrolled users".
| error | Return events where authentication was denied because of an error.
| locked_out                                        | Return events generated by users that are locked out.
|user_disabled                                      | Return events where authentication was denied because the user was disabled.
| user_cancelled                                    | Return events where authentication was denied because the end user cancelled the request.
| invalid_passcode                                  | Return events where authentication was denied because the passcode was invalid.
| no_response                                       | Return events where authentication was denied because there was no response from the user.
| no_keys_pressed                                   | Return events where authentication was denied because no keys were pressed to accept the auth.
| call_timed_out                                    | Return events where authentication was denied because the call was not answered or call authentication timed out for an indeterminate reason.
| location_restricted                               | Return events where authentication was denied because the end user's location was restricted.
| factor_restricted                                 | Return events where authentication was denied because the authentication method used was not allowed.
| platform_restricted                               | Return events where authentication was denied because the access platform was not allowed.
| version_restricted                                | Return events where authentication was denied because the software version was not allowed.
| rooted_device                                     | Return events where authentication was denied because the approval device was rooted.
| no_screen_lock                                    | Return events where authentication was denied because the approval device does not have screen lock enabled.
| touch_id_disabled                                 | Return events where authentication was denied because the approval device's biometrics (fingerprint, Face ID or Touch ID) is disabled.
| no_disk_encryption                                | Return events where authentication was denied because the approval device did not have disk encryption enabled.
| anonymous_ip                                      | Return events where authentication was denied because the authentication request came from an anonymous IP address.
| out_of_date                                       | Return events where authentication was denied because the software was out of date.
| denied_by_policy                                  | Return events where authentication was denied because of a policy.
| software_restricted                               | Return events where authentication was denied because of software restriction.
| no_duo_certificate_present                        | Return events where authentication was denied because there was no Duo certificate present.
| user_provided_invalid_certificate                 | Return events where authentication was denied because an invalid management certificate was provided.
| could_not_determine_if_endpoint_was_trusted       | Return events where authentication was denied because it could not be determined if the endpoint was trusted.
| invalid_management_certificate_collection_state   | Return events where authentication was denied because of an invalid management certificate collection state.
| no_referring_hostname_provided                    | Return events where authentication was denied because no referring hostname was provided.
| invalid_referring_hostname_provided               | Return events where authentication was denied because an invalid referring hostname was provided.
| no_web_referer_match                              | Return events where authentication was denied because an invalid referring hostname did not match an application's hostnames list.
| endpoint_failed_google_verification               | Return events where authentication was denied because the endpoint failed Google verification.
| endpoint_is_not_trusted                           | Return events where authentication was denied because the endpoint was not trusted.
| invalid_device                                    | Return events where authentication was denied because the device was invalid.
| anomalous_push                                    | Return events where authentication was denied because of an anomalous push.
| endpoint_is_not_in_management_system              | Return events where authentication was denied because the endpoint is not in a management system.
| no_activated_duo_mobile_account                   | Return events where authentication was denied because the end user does not have an activated Duo Mobile app account.
| allow_unenrolled_user                             | Return events where authentication was successful because of the following policy: "allow not enrolled users".
| bypass_user                                       | Return events where authentication was successful because a bypass code was used.
| trusted_network                                   | Return events where authentication was successful because the end user was on a trusted network.
| remembered_device                                 | Return events where authentication was successful because the end user was on a remembered device.
| trusted_location                                  | Return events where authentication was successful because the end user was in a trusted location.
| user_approved                                     | Return events where authentication was successful because the end user approved the authentication request.
| valid_passcode                                    | Return events where authentication was successful because the end user used a valid passcode.
| allowed_by_policy                                 | Return events where authentication was successful because of a policy.
| allow_unenrolled_user_on_trusted_network          | Return events where authentication was successful because the unenrolled user's access device was on an authorized network.
| user_not_in_permitted_group                       | Return events where authentication was denied because the user did not belong to one of the Permitted Groups specified in the application's settings.

Default: Return logs for any result.
Filtering on all values is equivalent to the default.

Note that enrollment events have no associated reason.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Results
The result of an authentication attempt.
One of:

| Value | Description |
|-------|-------------|
| success | Return "successful" authentication events.
| denied | Return "denied" authentication events.
| fraud | Return "fraudulent" authentication events.

Default:    Return logs for any result.
Filtering on all values is equivalent to the default.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tokens
A WebAuthn security key's webauthnkey or U2F security key's registration_id as returned in the authentication log output.

Default: Return logs for security keys used.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

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
There is an intentional two minute delay in availability of new authentications in the API response.
Duo operates a large scale distributed system, and this two minute buffer period ensures that calls will return consistent results.
Querying for results more recent than two minutes will return as empty.

We recommend requesting logs no more than once per minute.

The v2 handler provides new filtering and querying capabilities unavailable in the legacy v1 handler.
This includes the ability to filter on users, groups, applications, authentication results, factors, and time ranges.

## RELATED LINKS

[https://duo.com/docs/adminapi#authentication-logs](https://duo.com/docs/adminapi#authentication-logs)

