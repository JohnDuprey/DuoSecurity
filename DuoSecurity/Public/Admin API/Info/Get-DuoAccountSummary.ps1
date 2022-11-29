function Get-DuoAccountSummary {
    [CmdletBinding()]
    Param()

    $DuoRequest = @{
        Method = 'GET'
        Path   = '/admin/v1/info/summary'
    }

    if ($Username) {
        $DuoRequest.Params = @{username = $Username }
    }
    $Request = Invoke-DuoRequest @DuoRequest
    
    if ($Request.stat -ne 'OK') {
        $Request
    }
    else {
        $Request.response
    }
    
} 