function Get-DuoPhones {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias('phone_id')]
        $PhoneId
    )

    process {
        if ($GroupId) {
            $Path = '/admin/v2/phones/{0}' -f $PhoneId
        }
        else {
            $Path = '/admin/v1/phones'
            $Params = @{ offset = 0 }
        }
    
        $DuoRequest = @{
            Method = 'GET'
            Path   = $Path
        }
        if ($Params) {
            $DuoRequest.Params = $Params
            Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest
        }
        else {
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

Set-Alias -Name Get-DuoPhone -Value Get-DuoPhones
