function Update-DuoUser {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId,

        [string]$Username,

        [string[]]$Aliases,

        [string]$FullName,

        [string]$Email,

        [ValidateSet('Active', 'Bypass', 'Disabled')]
        [string]$Status,

        [string]$Notes,

        [string]$FirstName,

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

        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        }
        else {
            $Request.response
        }
    }
}
