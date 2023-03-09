function Send-DuoPhoneActivationSms {
    <#
    .SYNOPSIS
    Send Activation Code via SMS

    .DESCRIPTION
    Generate a Duo Mobile activation code and send it to the phone via SMS, optionally sending an additional message with a URL to install Duo Mobile. This method will fail if the phone's type or platform are Unknown. Requires "Grant write resource" API permission.

    .PARAMETER PhoneId
    Parameter description

    .PARAMETER ValidSecs
    The number of seconds this activation code remains valid. Default: 86400 (one day).

    .PARAMETER Install
    Specify 1 to cause an installation SMS message to be sent before the activation message, or 0 to not send an installation SMS message. Default: 0.

    .PARAMETER InstallationMsg
    A custom installation message to send to the user. Only valid if installation was requested. Must contain the phrase "<insturl>", which is replaced with the installation URL.

    .PARAMETER ActivationMsg
    A custom activation message to send to the user. Must contain "<acturl>", which is replaced with the activation URL.

    .EXAMPLE
    Send-DuoPhoneActivationSms -PhoneId SOMEDUOID -ValidSecs 3600 -Install 1

    .LINK
    https://duo.com/docs/adminapi#send-activation-code-via-sms

    .NOTES
    SMS Size Limits
    The recommended maximum length for activation_msg and installation_msg is 80 characters.

    Activation and installation SMS messages are limited to 160 characters or less. If providing custom text, please make sure to leave enough room for a URL to be sent in the same message. The exact length available for custom text varies depending on the device's platform and whether international characters were used. Activation URLs are typically about 60 characters long. Installation URLs are between 50 and 75 characters long.
    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('phone_id')]
        [string]$PhoneId,

        [Parameter()]
        [int]$ValidSecs = 86400,

        [Parameter()]
        [int]$Install = 0,

        [Parameter()]
        [string]$InstallationMsg,

        [Parameter()]
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
        } else {
            $Request.response
        }
    }
}
