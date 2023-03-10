function Set-DuoCustomBranding {
    <#
    .SYNOPSIS
    Modify Custom Messaging

    .DESCRIPTION
    Updates current custom messaging settings, shown to users in the Universal Prompt. These settings can also be viewed and set in the Duo Admin Panel. Supersedes the helpdesk_message Settings parameter. Requires "Grant settings" API permission.

    .PARAMETER HelpLinks
    A comma-separated list of up to two custom external links shown to users in the Universal Prompt. Each URL must begin with http:// or https://

    .PARAMETER HelpText
    Customized text string associated with the specified locale. The user's browser's preferred language settings determine which language to show in the Universal Prompt. The first locale and message text in the list matches the default language specified in global Settings and is also shown in the traditional web prompt and in the Duo Device Health app. Up to 200 characters. No support for hyperlinks.

    .PARAMETER Locale
    The language of the help text. One of: en_US (English), cs_CZ (Czech), de_DE (German), es_ES (Spanish - Spain), es_419 (Spanish - Latin America), fi_FI (Finnish), fr_FR (French), hi_IN (Hindi), id_ID (Indonesian), it_IT (Italian), ja_JP (Japanese), ko_KR (Korean), nb_NO (Norwegian - Bokmal), pl_PL (Polish), pt_BR (Portuguese - Brazil), sv_SE (Swedish), th_TH (Thai), tr_TR (Turkish), vi_VN (Vietnamese), or zh_hans_CN (Chinese - Simplified).

    .EXAMPLE
    Set-DuoCustomMessaging -HelpLinks 'https://duo.com/docs/adminapi#modify-custom-messaging'

    .INPUTS
    None

    .OUTPUTS
    PSCustomObject. Returns a Duo Custom Messaing object.

    .LINK
    https://duo.com/docs/adminapi#modify-custom-messaging

    .NOTES

    #>
    [CmdletBinding(SupportsShouldProcess, DefaultParameterSetName = 'NoHelpText')]
    Param(
        [Parameter()]
        [string[]]$HelpLinks,

        [Parameter(Mandatory = $true, ParameterSetName = 'HelpText')]
        [string]$HelpText,

        [Parameter(ParameterSetName = 'HelpText')]
        [ValidateSet('en_US', 'cs_CZ', 'es_419', 'fi_FI', 'fr_FR', 'hi_IN', 'id_ID', 'it_IT', 'ja_JP', 'ko_KR', 'nb_NO', 'pl_PL', 'pt_BR', 'sv_SE', 'th_TH', 'tr_TR', 'vi_VN', 'zh_hans_CN')]
        [string]$Locale = 'en_US'
    )

    process {
        $Params = @{}

        if ($HelpLinks) {
            $HelpLinks = $HelpLinks | Select-Object -First 2
            $Params.help_links = $HelpLinks -join ','
        }

        if ($HelpText) {
            $Params.help_text = $HelpText
            $Params.locale = $Locale
        }

        $DuoRequest = @{
            Method     = 'POST'
            Path       = '/admin/v1/branding/custom_messaging'
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
