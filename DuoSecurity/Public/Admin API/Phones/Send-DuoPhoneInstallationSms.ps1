function Send-DuoPhoneInstallationSms {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('phone_id')]
        [string]$PhoneId,
        [string]$InstallationMsg
    )

    process {
        $Params = @{}
        if ($InstallationMsg) {
            if ($InstallationMsg -notmatch '<insturl>') {
                Write-Error 'Installation message must contain <insturl>'
                return $false
            }
            $Params.installation_msg = $InstallationMsg
        }

        $DuoRequest = @{
            Method = 'POST'
            Path   = '/admin/v1/phones/{0}/send_sms_installation' -f $PhoneId
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
