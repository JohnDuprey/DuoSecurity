function Send-DuoPhoneInstallationSms {
    <#
    .SYNOPSIS
    Send Installation URL via SMS

    .DESCRIPTION
    Send a message via SMS describing how to install Duo Mobile. This method will fail if the phone's type or platform are Unknown. Requires "Grant write resource" API permission.

    .PARAMETER PhoneId
    Id of phone

    .PARAMETER InstallationMsg
    A custom installation message to send to the user. Must contain the phrase "<insturl>", which is replaced with the installation URL.

    .EXAMPLE
    Send-DuoPhoneInstallationSms -PhoneId SOMEDUOID -InstallationMsg 'Install Duo Mobile! <insturl> - Your friendly IT department'

    .LINK
    https://duo.com/docs/adminapi#send-installation-url-via-sms

    .NOTES
    SMS Size Limits
    The recommended maximum length for installation_msg is 80 characters.

    Installation SMS messages are limited to 160 characters or less. If providing custom text, please make sure to leave enough room for a URL to be sent in the same message. The exact length available for custom text varies depending on the device's platform and whether international characters were used. Installation URLs are between 50 and 75 characters long.
    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('phone_id')]
        [string]$PhoneId,

        [Parameter()]
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
        } else {
            $Request.response
        }
    }
}
