function New-DuoPhoneActivationCode {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('phone_id')]
        [string]$PhoneId,

        [int]$ValidSecs = 86400,

        [int]$Install = 0
    )

    process {
        $Params = @{}
        if ($ValidSecs) { $Params.valid_secs = $ValidSecs }
        if ($Install) { $Params.install = $Install }

        $DuoRequest = @{
            Method = 'POST'
            Path   = '/admin/v1/phones/{0}/activation_url' -f $PhoneId
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
