function New-DuoGroup {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Name,

        [string]$Description = '',

        [ValidateSet('Active', 'Bypass', 'Disabled')]
        [string]$Status = 'Active'
    )

    $Params = @{
        name   = $Name
        desc   = $Description
        status = $Status.ToLower()
    }

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/groups'
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
