function New-DuoPhone {
    <#
    .SYNOPSIS
    Create Phone

    .DESCRIPTION
    Create a new phone with a specified phone number or other parameters. Requires "Grant write resource" API permission.

    .PARAMETER Number
    The phone number; E.164 format recommended (i.e. "+17345551212"). If no leading plus sign is provided then it is assumed to be a United States number and an implicit "+1" country code is prepended. Dashes and spaces are ignored.

    A phone with a smartphone platform but no number is a tablet.

    .PARAMETER Name
    Free-form label for the phone.

    .PARAMETER Extension
    The extension.

    .PARAMETER Type
    The phone type. See Retrieve Phones for a list of possible values.

    .PARAMETER Platform
    The phone platform. See Retrieve Phones for a list of possible values.

    .PARAMETER PostDelay
    The time (in seconds) to wait after the extension is dialed and before the speaking the prompt.

    .PARAMETER PreDelay
    The time (in seconds) to wait after the number picks up and before dialing the extension.

    .EXAMPLE
    New-DuoPhone -Name 'TestPhone -Number '+15558675309' -Type Mobile -Platform 'Apple iOS'

    .LINK
    https://duo.com/docs/adminapi#create-phone

    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter()]
        [string]$Number,

        [Parameter()]
        [string]$Name,

        [Parameter()]
        [string]$Extension,

        [Parameter()]
        [ValidateSet('Unknown', 'Mobile', 'Landline')]
        [string]$Type = 'Mobile',

        [Parameter()]
        [ValidateSet('Unknown', 'Google Android', 'Apple iOS', 'Windows Phone', 'RIM Blackberry', 'Java J2me', 'Palm WebOS', 'Symbian OS', 'Windows Mobile', 'Generic Smartphone')]
        [string]$Platform = 'Generic Smartphone',

        [Parameter()]
        [int]$PostDelay,

        [Parameter()]
        [int]$PreDelay
    )

    $Params = @{}
    if ($Number) { $Params.number = $Number }
    if ($Name) { $Params.name = $Name }
    if ($Extension) { $Params.extension = $Extension }
    if ($Type) { $Params.type = $Type.ToLower() }
    if ($Platform) { $Params.platform = $Platform.ToLower() }
    if ($PreDelay) { $Params.predelay = $PreDelay }
    if ($PostDelay) { $Params.postdelay = $PostDelay }

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/phones'
        Params = $Params
    }

    if ($PSCmdlet.ShouldProcess("$Type - $Platform")) {
        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        } else {
            $Request.response
        }
    }
}
