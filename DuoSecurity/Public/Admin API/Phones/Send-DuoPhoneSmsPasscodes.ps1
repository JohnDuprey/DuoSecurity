function Send-DuoPhoneSmsPasscodes {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('phone_id')]
        [string]$PhoneId
    )

    process {
        $DuoRequest = @{
            Method = 'POST'
            Path   = '/admin/v1/phones/{0}/send_sms_passcodes' -f $PhoneId
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
