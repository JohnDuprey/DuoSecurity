function Send-DuoPhoneSmsPasscode {
    <#
    .SYNOPSIS
    Send Passcodes via SMS

    .DESCRIPTION
    Generate a new batch of SMS passcodes send them to the phone in a single SMS message. Requires "Grant write resource" API permission.

    .PARAMETER PhoneId
    Id of phone

    .EXAMPLE
    Send-DuoPhoneSmsPasscode -PhoneId SOMEDUOID

    .LINK
    https://duo.com/docs/adminapi#send-passcodes-via-sms

    #>
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
        } else {
            $Request.response
        }
    }
}

Set-Alias -Name Send-DuoPhoneSmsPasscodes -Value Send-DuoPhoneSmsPasscode