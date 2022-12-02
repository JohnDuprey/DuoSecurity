function Update-DuoPhone {
    <#
    .SYNOPSIS
    Modify Phone
    
    .DESCRIPTION
    Change the details of the phone with ID phone_id. Requires "Grant write resource" API permission.
    
    .PARAMETER PhoneId
    Id of phone
    
    .PARAMETER Number
    The new phone number; E.164 format recommended (i.e. "+17345551212"). If no leading plus sign is provided then it is assumed to be a United States number and an implicit "+1" country code is prepended. Dashes and spaces are ignored.
    
    .PARAMETER Name
    Free-form label for the phone.
    
    .PARAMETER Extension
    The new extension.
    
    .PARAMETER Type
    The phone type. See Retrieve Phones for a list of possible values.
    
    .PARAMETER Platform
    The phone platform. See Retrieve Phones for a list of possible values.The time (in seconds) to wait after the number picks up and before dialing the extension.
    
    .PARAMETER PostDelay
    The time (in seconds) to wait after the extension is dialed and before the speaking the prompt.
    
    .PARAMETER PreDelay
    The time (in seconds) to wait after the number picks up and before dialing the extension.
    
    .EXAMPLE
    Update-DuoPhone -PhoneId SOMEDUOID -Name 'New phone name'
    
    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('phone_id')]
        [string]$PhoneId,

        [string]$Number,

        [string]$Name,

        [string]$Extension,

        [ValidateSet('Unknown', 'Mobile', 'Landline')]
        [string]$Type = 'Mobile',

        [ValidateSet('Unknown', 'Google Android', 'Apple iOS', 'Windows Phone', 'RIM Blackberry', 'Java J2me', 'Palm WebOS', 'Symbian OS', 'Windows Mobile', 'Generic Smartphone')]
        [string]$Platform = 'Generic Smartphone',

        [int]$PostDelay,
        [int]$PreDelay
    )

    process {
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
            Path   = '/admin/v1/phones/{0}' -f $PhoneId
            Params = $Params
        }

        if ($PSCmdlet.ShouldProcess($PhoneId)) {
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
