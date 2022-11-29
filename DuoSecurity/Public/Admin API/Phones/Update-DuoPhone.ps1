function Update-DuoPhone {
    [CmdletBinding()]
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

        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        }
        else {
            $Request.response
        }
    }
}
