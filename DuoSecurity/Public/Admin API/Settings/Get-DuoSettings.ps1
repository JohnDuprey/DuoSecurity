function Get-DuoSettings {
    [CmdletBinding()]
    Param()

    $DuoRequest = @{
        Method = 'GET'
        Path   = '/admin/v1/settings'
    }

    $Request = Invoke-DuoRequest @DuoRequest
    if ($Request.stat -ne 'OK') {
        $Request
    }
    else {
        $Request.response
    }
} 
