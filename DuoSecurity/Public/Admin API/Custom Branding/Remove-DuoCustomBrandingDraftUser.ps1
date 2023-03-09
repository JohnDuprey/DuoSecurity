function Remove-DuoCustomBrandingDraftUser {
    <#
    .SYNOPSIS
    Remove Draft Custom Branding User by ID

    .DESCRIPTION
    Remove a single user with ID user_id from the list of draft branding test users. Requires "Grant settings" API permission.

    .EXAMPLE
    Remove-DuoCustomBrandingDraftUser -UserId SOMEUSERID

    .INPUTS
    None

    .OUTPUTS
    PSCustomObject. Returns a Duo Response object.

    .LINK
    https://duo.com/docs/adminapi#add-draft-custom-branding-user-by-id

    .NOTES

    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId
    )

    $DuoRequest = @{
        Method = 'DELETE'
        Path   = '/admin/v1/branding/draft/users/{0}' -f $UserId
    }

    if ($PSCmdlet.ShouldProcess($UserId)) {
        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        } else {
            $Request.response
        }
    }
}
