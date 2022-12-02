function Update-DuoAdmin {
    <#
    .SYNOPSIS
    Modify Administrator
    
    .DESCRIPTION
    Change the name, phone number, or other properties of the administrator with the administrator ID admin_id. Requires "Grant administrators" API permission.
    
    .PARAMETER AdminId
    The ID of the administrator
    
    .PARAMETER Name
    New name for the administrator. Read-only if the admin is managed by directory sync.
    
    .PARAMETER Phone
    The phone number; E.164 format recommended (i.e. "+17345551212"). If no leading plus sign is provided then it is assumed to be a United States number and an implicit "+1" country code is prepended. Dashes and spaces are ignored.

    If this parameter is specified it cannot be empty.
    
    .PARAMETER PasswordChangeRequested
    Specify true to require that the admin pick a new password at their next login, or false if no password change is required. May not be changed to true if the admin has external password management enabled.
    
    .PARAMETER Role
    New role for the administrator. One of: "Owner", "Administrator", "Application Manager", "User Manager", "Help Desk", "Billing", "Phishing Manager", or "Read-only". The role names are case-sensitive. Roles other than "Owner" are effective only if the customer edition includes the Administrative Roles feature. Read-only if the admin is managed by directory sync.
    
    .PARAMETER RestrictedByAdminUnits
    Is this administrator restricted by an administrative unit assignment? Either true or false. Must be set to true in order to add the admin to an administrative unit using the API. Note that attempting to set to true for admins with the "Owner" role results in a failure response.
    
    .PARAMETER Status
    The desired administrator account status. Either "Active" or "Disabled" (case-sensitive). Administrators with the "Owner" role may not be disabled via API. To clear an inactive admin's "Expired" status, see Clear Administrator Expiration. Read-only if the admin is managed by directory sync.
    
    .PARAMETER TokenId
    The ID of the hardware token to associate with the administrator. Specify with no value to remove any existing token assignment for that administrator.
    
    .EXAMPLE
    Update-DuoAdmin -AdminId SOMEADMINID -Status Disabled
    
    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('admin_id')]
        [string]$AdminId,

        [string]$Name,
        
        [string]$Phone,

        [switch]$PasswordChangeRequested,

        [ValidateSet('Owner', 'Administrator', 'Application Manager', 'User Manager', 'Help Desk', 'Billing', 'Phishing Manager', 'Read-Only')]
        [string]$Role,

        [switch]$RestrictedByAdminUnits,

        [ValidateSet('Active', 'Disabled')]
        [string]$Status,

        [string]$TokenId
    )

    process {
        $Params = @{}

        if ($Name) { $Params.name = $Name }
        if ($Phone) { $Params.phone = $Phone }
        if ($PasswordChangeRequested.IsPresent) { $Params.password_change_requested = $PasswordChangeRequested.IsPresent }
        if ($Role) { $Params.role = $Role }
        if ($RestrictedByAdminUnits.IsPresent) { $Params.restricted_by_admin_units = $RestrictedByAdminUnits.IsPresent }
        if ($Status) { $Params.status = $Status }
        if ($TokenId) { $Params.token_id = $TokenId }

        $DuoRequest = @{
            Method = 'POST'
            Path   = '/admin/v1/admins/{0}' -f $AdminId
            Params = $Params
        }

        if ($PSCmdlet.ShouldProcess($AdminId)) {
            $Request = Invoke-DuoRequest @DuoRequest
            if ($Request.stat -ne 'OK') {
                $Request
            }
            else {
                $Request.response
            }
        }
    }
}
