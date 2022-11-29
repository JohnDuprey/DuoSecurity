function New-DuoUser {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Username,

        [string[]]$Aliases = @(),

        [string]$FullName = '',

        [string]$Email = '',

        [ValidateSet('Active', 'Bypass', 'Disabled')]
        [string]$Status = 'Active',

        [string]$Notes = '',

        [string]$FirstName = '',

        [string]$LastName = ''
    )

    $x = 1
    $AliasList = foreach ($Alias in $Aliases) {
        if ($x -gt 8) { break }
        @{ "alias$x" = $Alias }
        $x++
    }

    $Params = @{
        username  = $Username
        aliases   = $AliasList
        realname  = $FullName
        email     = $Email
        status    = $Status.ToLower()
        notes     = $Notes
        firstname = $FirstName
        lastname  = $LastName
    }

    $DuoRequest = @{
        Method = 'POST'
        Path = '/admin/v1/users'
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
