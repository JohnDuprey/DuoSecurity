function New-DuoPhoneActivationCode {
    <#
    .SYNOPSIS
    Create Activation Code
    
    .DESCRIPTION
    Generate a Duo Mobile activation code. This method will fail if the phone's type or platform are Unknown. Requires "Grant write resource" API permission.
    
    .PARAMETER PhoneId
    Id of phone
    
    .PARAMETER ValidSecs
    The number of seconds this activation code remains valid. Default: 86400 (one day). Expiration not supported for legacy phone platforms that support passcode generation only (not Duo Push).
    
    .PARAMETER Install
    Specify 1 to also return an installation URL for Duo Mobile; 0 to not return a URL. Default: 0.
    
    .EXAMPLE
    An example
    
    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('phone_id')]
        [string]$PhoneId,

        [Parameter()]
        [int]$ValidSecs = 86400,

        [Parameter()]
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
