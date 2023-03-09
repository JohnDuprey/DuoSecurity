function Update-DuoUser {
    <#
    .SYNOPSIS
    Modify User

    .DESCRIPTION
    Change the username, username aliases, full name, status, and/or notes section of the user with ID user_id. Requires "Grant write resource" API permission.

    .PARAMETER UserId
    The ID of the User

    .PARAMETER Username
    The new username.

    .PARAMETER Aliases
    Username aliases for the user. Up to eight aliases may be specified with this parameter as a set of URL-encoded key-value pairs e.g. alias1=joe.smith&alias2=jsmith@example.com. Ignores alias position values not specified. Remove the value for an existing alias by specifying a blank value e.g. alias1=. Aliases must be unique amongst users.

    .PARAMETER FullName
    The new real name (or full name).

    .PARAMETER Email
    The new email address.

    .PARAMETER Status
    The new status. Must be one of "active", "disabled", or "bypass". See Retrieve Users for an explanation of these fields.

    .PARAMETER Notes
    The new notes field.

    .PARAMETER FirstName
    The user's new given name.

    .PARAMETER LastName
    The user's new surname.

    .EXAMPLE
    Update-DuoUser -UserId SOMEUSERID -Status Disabled

    .LINK
    https://duo.com/docs/adminapi#modify-user

    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId,

        [Parameter()]
        [string]$Username,

        [Parameter()]
        [string[]]$Aliases,

        [Parameter()]
        [string]$FullName,

        [Parameter()]
        [string]$Email,

        [Parameter()]
        [ValidateSet('Active', 'Bypass', 'Disabled')]
        [string]$Status,

        [Parameter()]
        [string]$Notes,

        [Parameter()]
        [string]$FirstName,

        [Parameter()]
        [string]$LastName
    )

    process {
        $Params = @{}
        if ($Aliases) {
            $x = 1
            $AliasList = foreach ($Alias in $Aliases) {
                if ($x -gt 8) { break }
                @{ "alias$x" = $Alias }
                $x++
            }
            $Params.aliases = $AliasList
        }

        if ($Username) { $Params.username = $Username }
        if ($FullName) { $Params.realname = $FullName }
        if ($Email) { $Params.email = $Email }
        if ($Status) { $Params.status = $Status.ToLower() }
        if ($Notes) { $Params.notes = $Notes }
        if ($FirstName) { $Params.firstname = $FirstName }
        if ($LastName) { $Params.lastname = $LastName }

        $DuoRequest = @{
            Method = 'POST'
            Path   = '/admin/v1/users/{0}' -f $UserId
            Params = $Params
        }

        if ($PSCmdlet.ShouldProcess($UserId)) {
            $Request = Invoke-DuoRequest @DuoRequest
            if ($Request.stat -ne 'OK') {
                $Request
            } else {
                $Request.response
            }
        }
    }
}
