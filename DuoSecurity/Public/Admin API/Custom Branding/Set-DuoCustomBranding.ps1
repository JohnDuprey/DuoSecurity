function Set-DuoCustomBranding {
    <#
    .SYNOPSIS
    Modify Custom Branding

    .DESCRIPTION
    Change effective or draft custom branding settings. These settings can also be viewed and set in the Duo Admin Panel. Requires "Grant settings" API permission.

    .PARAMETER Draft
    Use this switch to modify the draft branding instead of live.

    .PARAMETER BackgroundImg
    A PNG file path or base64 encoded background image in PNG format, with maximum size less than 3MB and dimensions between 12 by 12 pixels and 3840 by 2160 pixels. Shown in Duo SSO and Duo Universal Prompt.

    .PARAMETER CardAccentColor
    A CSS hex color shown as the hash symbol (#) followed by three or six hexadecimal digits, which represents the colored line appearing at the top of the interactive user interface. Shown in Duo SSO and Universal Prompt.

    .PARAMETER Logo
    A PNG file path or base64 encoded logo image in PNG format, with maximum size less than 200KB and dimensions between 12 by 12 pixels and 500 by 500 pixels. Shown in Duo SSO, Duo Universal Prompt, and traditional prompt.

    .PARAMETER PageBackgroundColor
    A CSS hex color shown as the hash symbol (#) followed by three or six hexadecimal digits, which represents the color appearing behind the user interface and any transparent background image. Shown in Duo SSO and Universal Prompt.

    .PARAMETER PoweredByDuo
    If true, Duo SSO, Duo Universal Prompt, and traditional prompt show the "Secured by Duo" branding. Otherwise, false.

    .PARAMETER UserIds
    A comma separated list of user IDs that will see saved draft branding in Duo SSO and Duo Universal Prompt.

    .EXAMPLE
    Set-DuoCustomBranding -Draft -Logo c:\path\to\logo.png

    .INPUTS
    None

    .OUTPUTS
    PSCustomObject. Returns a Duo Response object.

    .LINK
    https://duo.com/docs/adminapi#modify-live-custom-branding

    .LINK
    https://duo.com/docs/adminapi#modify-draft-custom-branding

    .NOTES
    This commandlet supports both Draft and Live branding options.

    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter()]
        [switch]$Draft,

        [Parameter()]
        [string]$BackgroundImg,

        [Parameter()]
        [ValidatePattern('^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$')]
        [string]$CardAccentColor,

        [Parameter()]
        [string]$Logo,

        [Parameter()]
        [ValidatePattern('^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$')]
        [string]$PageBackgroundColor,

        [Parameter()]
        [switch]$PoweredByDuo,

        [Parameter()]
        [string[]]$UserIds
    )

    process {
        if ($Draft) {
            $Path = '/admin/v1/branding/draft'
        } else {
            $Path = '/admin/v1/branding'
        }

        $Params = @{}

        if ($BackgroundImg) {
            if (Test-Path $BackgroundImg) {
                if (Test-PngFile -Path $BackgroundImg) {
                    $BackgroundImg = ConvertTo-Base64 -Path $BackgroundImg
                } else {
                    Write-Error "$BackgroundImg is not a PNG file"
                    return $false
                }
            }
            $Params.background_img = $BackgroundImg
        }

        if ($CardAccentColor) { $Params.card_accent_color = $CardAccentColor }

        if ($Logo) {
            if (Test-Path $Logo) {
                if (Test-PngFile -Path $Logo) {
                    $Logo = ConvertTo-Base64 -Path $Logo
                } else {
                    Write-Error "$Logo is not a PNG file"
                    return $false
                }
            }
            $Params.background_img = $BackgroundImg
        }

        if ($PageBackgroundColor) { $Params.page_background_color = $PageBackgroundColor }

        if ($PoweredByDuo.IsPresent) { $Params.powered_by_duo = $PoweredByDuo.IsPresent }

        if ($Draft) {
            if ($UserIds) {
                $Params.user_ids = @($UserIds)
            }
        }

        $DuoRequest = @{
            Method     = 'POST'
            Path       = $Path
            Parameters = $Params
        }

        if ($PSCmdlet.ShouldProcess($AccountId)) {
            $Response = Invoke-DuoRequest @DuoRequest
            if ($Response.stat -eq 'OK') {
                $Response.response
            } else {
                $Response
            }
        }
    }
}
