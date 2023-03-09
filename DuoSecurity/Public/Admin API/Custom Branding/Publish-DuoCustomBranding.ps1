function Publish-DuoCustomBranding {
    <#
    .SYNOPSIS
    Publish Draft Custom Branding as Live Custom Branding

    .DESCRIPTION
    Replaces the current live custom branding with the draft custom branding for all users and then removes the draft branding. Requires "Grant settings" API permission.

    .EXAMPLE
    Publish-DuoCustomBranding

    .INPUTS
    None

    .OUTPUTS
    PSCustomObject. Returns a Duo Response object.

    .LINK
    https://duo.com/docs/adminapi#publish-draft-custom-branding-as-live-custom-branding

    .NOTES

    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param()

    $DuoRequest = @{
        Method = 'POST'
        Path   = '/admin/v1/branding/draft/publish'
    }

    if ($PSCmdlet.ShouldProcess()) {
        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        } else {
            $Request.response
        }
    }
}
