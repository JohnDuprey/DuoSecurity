function Get-DuoCustomBranding {
    <#
    .SYNOPSIS
    Retrieve Draft Custom Branding
    
    .DESCRIPTION
    Returns custom branding settings. These settings can also be viewed and set in the Duo Admin Panel. Requires "Grant settings" API permission.
    
    .PARAMETER Draft
    Use this switch to retreieve the draft branding

    .PARAMETER OutputDirectory
    Path to save the branding images to

    .EXAMPLE
    Get-DuoCustomBranding

    .LINK
    https://duo.com/docs/adminapi#retrieve-live-custom-branding

    #>
    [CmdletBinding()]
    Param(
        [Parameter()]
        [switch]$Draft,

        [Parameter()]
        [string]$OutputDirectory
    )

    if ($Draft) {
        $Path = '/admin/v1/branding/draft'
    }
    else {
        $Path = '/admin/v1/branding'
    }

    $DuoRequest = @{
        Method = 'GET'
        Path   = $Path
    }

    $Request = Invoke-DuoRequest @DuoRequest
    if ($Request.stat -ne 'OK') {
        $Request

        if ($OutputDirectory) {
            if ($Request.background_image) {
                $ImageFile = Join-Path $OutputDirectory '/background_image.png'
                ConvertFrom-Base64 -Base64 $Request.background_image -Path $ImageFile
            }

            if ($Request.logo) {
                $ImageFile = Join-Path $OutputDirectory '/logo.png'
                ConvertFrom-Base64 -Base64 $Request.logo -Path $ImageFile
            }
        }
    }
    else {
        $Request.response
    }
} 
