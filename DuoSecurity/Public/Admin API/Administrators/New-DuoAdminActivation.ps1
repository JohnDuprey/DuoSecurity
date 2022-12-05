function New-DuoAdminActivation {
    <#
    .SYNOPSIS
    Create Administrator Activation Link
    
    .DESCRIPTION
    Create a link to the activation form for a new administrator with email address email. The administrator will not actually be created until the activation form is completed with further information (like the administrator's name and phone number). Requires "Grant administrators" API permission.
    
    .PARAMETER Email
    Email address for the new administrator. Must not already be in use by any other administrator or pending administrator activation.
    
    .PARAMETER AdminName
    The full name of the administrator. The administrator's email will be used as the name if not specified.
    
    .PARAMETER AdminRole
    The administrator's role. One of: "Owner", "Administrator", "Application Manager", "User Manager", "Help Desk", "Billing", "Phishing Manager", or "Read-only". The role names are case-sensitive. Defaults to "Owner" if not specified. Roles other than "Owner" are effective only if the customer edition includes the Administrative Roles feature.
    
    .PARAMETER SendEmail
    If set to 1, the activation link and an introductory message will be emailed to the new administrator. If set to 0, no email is sent, and the link is returned to the API method's caller only. Default: 0.
    
    .PARAMETER ValidDays
    Number of days before the link expires. Default: 7 Maximum: 31
    
    .EXAMPLE
    New-DuoAdminActivation -Email peter.gibbons@initech.com

    .LINK
    https://duo.com/docs/adminapi#create-administrator-activation-link
    
    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Email,

        [Parameter()]
        [string]$AdminName,

        [Parameter()]
        [ValidateSet('Owner', 'Administrator', 'Application Manager', 'User Manager', 'Help Desk', 'Billing', 'Phishing Manager', 'Read-Only')]
        [string]$AdminRole,

        [Parameter()]
        [ValidateRange(0, 1)]
        [int]$SendEmail,

        [Parameter()]
        [ValidateRange(1, 31)]
        [int]$ValidDays
    )

    $Params = @{
        email = $Email
    }
    
    if ($AdminName) { $Params.admin_name = $AdminName }
    if ($AdminRole) { $Params.admin_role = $AdminRole }
    if ($SendEmail) { $Params.send_email = $SendEmail }
    if ($ValidDays) { $Params.valid_days = $ValidDays }

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/admins/activations'
        Params = $Params
    }

    if ($PSCmdlet.ShouldProcess($Email)) {
        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        }
        else {
            $Request.response
        }
    }
}
