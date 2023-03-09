function New-DuoAdmin {
    <#
    .SYNOPSIS
    Create Administrator

    .DESCRIPTION
    Create a new administrator. Requires "Grant administrators" API permission.

    .PARAMETER Email
    Valid email address for the new administrator.

    .PARAMETER Name
    Name for the new administrator.

    .PARAMETER Phone
    Phone number for the new administrator; E.164 format recommended (i.e. "+17345551212"). If no leading plus sign is provided then it is assumed to be a United States number and an implicit "+1" country code is prepended. Dashes and spaces are ignored.

    If this parameter is specified it cannot be empty.

    .PARAMETER Role
    The administrator's role. One of: "Owner", "Administrator", "Application Manager", "User Manager", "Help Desk", "Billing", "Phishing Manager", or "Read-only". The role names are case-sensitive. Defaults to "Owner" if not specified.

    Roles other than "Owner" are effective only if the customer edition includes the Administrative Roles feature.

    .PARAMETER RestrictedByAdminUnits
    Is this administrator restricted by an administrative unit assignment? Either true or false. Defaults to false if not specified. Must be set to true in order to add the admin to an administrative unit using the API. Note that attempting to set to true for admins with the "Owner" role results in a failure response.

    .PARAMETER SendEmail
    If set to 1, the activation link and an introductory message will be emailed to the new administrator. If set to 0, no email is sent, and the link is returned to the API method's caller only. Default: 0.

    .PARAMETER TokenId
    The token_id of the hardware token to associate with the administrator.

    .PARAMETER ValidDays
    Number of days before the activation link expires. Default: 7 Maximum:: 31

    .EXAMPLE
    New-DuoAdmin -Email peter.gibbons@initech.com -Name 'Peter Gibbons'

    .LINK
    https://duo.com/docs/adminapi#create-administrator

    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Email,

        [Parameter(Mandatory = $true)]
        [string]$Name,

        [Parameter()]
        [string]$Phone,

        [Parameter()]
        [ValidateSet('Owner', 'Administrator', 'Application Manager', 'User Manager', 'Help Desk', 'Billing', 'Phishing Manager', 'Read-Only')]
        [string]$Role,

        [Parameter()]
        [switch]$RestrictedByAdminUnits,

        [Parameter()]
        [switch]$SendEmail,

        [Parameter()]
        [string]$TokenId,

        [Parameter()]
        [ValidateRange(1, 31)]
        [int]$ValidDays
    )

    $Params = @{
        email = $Email
        name  = $Name
    }

    if ($Phone) { $Params.phone = $Phone }
    if ($Role) { $Params.role = $Role }
    if ($RestrictedByAdminUnits.IsPresent) { $Params.restricted_by_admin_units = $RestrictedByAdminUnits.IsPresent }
    if ($SendEmail.IsPresent) { $Params.send_email = 1 }
    if ($TokenId) { $Params.token_id = $TokenId }
    if ($ValidDays) { $Params.valid_days = $ValidDays }

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/admins'
        Params = $Params
    }

    if ($PSCmdlet.ShouldProcess($Email)) {
        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        } else {
            $Request.response
        }
    }
}
