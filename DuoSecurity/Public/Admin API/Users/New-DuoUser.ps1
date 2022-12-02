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
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Username,

        [hashtable]$Aliases = @{},

        [string]$FullName = '',

        [string]$Email = '',

        [ValidateSet('Active', 'Bypass', 'Disabled')]
        [string]$Status = 'Active',

        [string]$Notes = '',

        [string]$FirstName = '',

        [string]$LastName = ''
    )

    if ($Aliases) {
        $Aliases = $Aliases | Sort-Object -Property @{e = { $_.name } }
    }

    $Params = @{
        username = $Username
    }

    if ($Aliases) { $Params.aliases = $Aliases }
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

    $Request = Invoke-DuoRequest @DuoRequest
    if ($Request.stat -ne 'OK') {
        $Request
    }
    else {
        $Request.response
    }
}
