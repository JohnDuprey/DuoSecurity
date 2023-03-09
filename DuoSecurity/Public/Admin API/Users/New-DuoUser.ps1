function New-DuoUser {
    <#
    .SYNOPSIS
    Create User

    .DESCRIPTION
    Create a new user with the specified username. Requires "Grant write resource" API permission.

    .PARAMETER Username
    The name of the user to create.

    .PARAMETER Aliases
    Username aliases for the user. Up to eight aliases may be specified with this parameter as a set of URL-encoded key-value pairs e.g. alias1=joe.smith&alias2=jsmith@example.com. Ignores alias position values not specified. Aliases must be unique amongst users.

    .PARAMETER FullName
    The real name (or full name) of this user.

    .PARAMETER Email
    The email address of this user.

    .PARAMETER Status
    The user's status. One of:

    Status	    Description
    ------      -----------
    "active"	The user must complete secondary authentication. This is the default value if no status is specified.
    "bypass"	The user will bypass secondary authentication after completing primary authentication.
    "disabled"	The user will not be able to complete secondary authentication.

    .PARAMETER Notes
    An optional description or notes field. Can be viewed in the Duo Admin Panel.

    .PARAMETER FirstName
    The user's given name.

    .PARAMETER LastName
    The user's surname.

    .EXAMPLE
    New-DuoUser -Username bob -Aliases @{alias1='bobby'; alias2='robert'} -Status Active

    .LINK
    https://duo.com/docs/adminapi#create-user

    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Username,

        [Parameter()]
        [hashtable]$Aliases = @{},

        [Parameter()]
        [string]$FullName = '',

        [Parameter()]
        [string]$Email = '',

        [Parameter()]
        [ValidateSet('Active', 'Bypass', 'Disabled')]
        [string]$Status = 'Active',

        [Parameter()]
        [string]$Notes = '',

        [Parameter()]
        [string]$FirstName = '',

        [Parameter()]
        [string]$LastName = ''
    )

    if ($Aliases) {
        $AliasCollection = [System.Web.HttpUtility]::ParseQueryString([String]::Empty)
        foreach ($Item in ($Aliases.GetEnumerator() | Sort-Object -CaseSensitive -Property Key)) {
            $AliasCollection.Add($Item.Key, $Item.Value)
        }
        $AliasString = [System.Web.HttpUtility]::UrlDecode($AliasCollection.ToString())
    }

    $Params = @{
        username = $Username
    }

    if ($Aliases) { $Params.aliases = $AliasString }
    if ($FullName) { $Params.realname = $FullName }
    if ($Email) { $Params.email = $Email }
    if ($Status) { $Params.status = $Status.ToLower() }
    if ($Notes) { $Params.notes = $Notes }
    if ($FirstName) { $Params.firstname = $FirstName }
    if ($LastName) { $Params.lastname = $LastName }

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/users'
        Params = $Params
    }

    if ($PSCmdlet.ShouldProcess($Username)) {
        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        } else {
            $Request.response
        }
    }
}
