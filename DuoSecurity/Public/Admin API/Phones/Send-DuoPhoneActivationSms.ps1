function Send-DuoPhoneActivationSms {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('phone_id')]
        [string]$PhoneId,

        [int]$ValidSecs = 86400,

        [int]$Install = 0,

        [string]$InstallationMsg,

        [string]$ActivationMsg
    )

    process {
        $Params = @{}
        if ($ValidSecs) { $Params.valid_secs = $ValidSecs }
        if ($Install) { 
            $Params.install = $Install 
            if ($InstallationMsg) {
                if ($InstallationMsg -notmatch '<insturl>') {
                    Write-Error 'Installation message must contain <insturl>'
                    return $false
                }
                $Params.installation_msg = $InstallationMsg
            }
        }
        if ($ActivationMsg) {
            if ($ActivationMsg -notmatch '<acturl>') {
                Write-Error 'Activation message must contain <acturl>'
                return $false
            }
            $Params.activation_msg = $ActivationMsg
        }

        $DuoRequest = @{
            Method = 'POST'
            Path   = '/admin/v1/phones/{0}/send_sms_activation' -f $PhoneId
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
